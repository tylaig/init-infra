#!/bin/bash
set -e

# Nome do cliente passado como argumento
CLIENTE=$1

echo ">>> Preparando servidor para o cliente: $CLIENTE"

# Atualiza pacotes
apt-get update -y && apt-get upgrade -y

# Instala dependências
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git

# Instala Docker caso não exista
if ! command -v docker &> /dev/null
then
    curl -fsSL https://get.docker.com | sh
    systemctl enable docker
    systemctl start docker
fi

# Ativa Docker Swarm (ignora erro se já estiver ativo)
docker swarm init || true

# Cria volumes necessários
docker volume create portainer_data || true
docker volume create volume_swarm_shared || true
docker volume create volume_swarm_certificates || true

# Cria rede overlay
docker network create --driver=overlay --attachable MSAppRede || true

# Clona ou atualiza repositório
if [ ! -d "/opt/init-infra" ]; then
    git clone https://github.com/tylaig/init-infra.git /opt/init-infra
else
    cd /opt/init-infra && git pull
fi

cd /opt/init-infra

# Substitui a palavra-chave "cliente" no portainer.yaml
sed "s/cliente/$CLIENTE/g" portainer.yaml > /opt/init-infra/portainer-$CLIENTE.yaml

# Deploy Traefik
docker stack deploy -c traefik.yaml traefik

# Deploy Portainer (com domínio ajustado)
docker stack deploy -c /opt/init-infra/portainer-$CLIENTE.yaml portainer

echo ">>> Instalação concluída para o cliente: $CLIENTE"
