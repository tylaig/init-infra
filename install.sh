#!/bin/bash
set -e

CLIENTE=$1
BASE_DIR="/opt/init-infra"

echo ">>> Preparando servidor para o cliente: $CLIENTE"

# ------------------------------
# Atualiza pacotes
# ------------------------------
apt-get update -y && apt-get upgrade -y
apt-get install -y apt-transport-https ca-certificates curl software-properties-common git

# ------------------------------
# Remove Docker antigo se existir
# ------------------------------
if command -v docker &> /dev/null; then
    echo ">>> Docker detectado, removendo versões antigas e containers..."
    
    # Para todos os containers
    docker ps -aq | xargs -r docker rm -f

    # Remove stacks existentes
    docker stack ls -q | xargs -r docker stack rm

    # Remove volumes
    docker volume ls -q | xargs -r docker volume rm -f

    # Remove imagens
    docker images -q | xargs -r docker rmi -f

    # Remove pacotes docker
    apt-get remove -y docker docker-engine docker.io containerd runc docker-ce docker-ce-cli docker-compose-plugin || true
    apt-get purge -y docker docker-engine docker.io containerd runc docker-ce docker-ce-cli docker-compose-plugin || true
    rm -rf /var/lib/docker /var/lib/containerd
fi

# ------------------------------
# Instala Docker do zero
# ------------------------------
echo ">>> Instalando Docker..."
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

# ------------------------------
# Inicializa Swarm (ignora se já ativo)
# ------------------------------
docker swarm init || true

# ------------------------------
# Cria volumes e rede
# ------------------------------
docker volume create portainer_data || true
docker volume create volume_swarm_shared || true
docker volume create volume_swarm_certificates || true
docker network create --driver=overlay --attachable MSAppRede || true

# ------------------------------
# Clona ou atualiza repo
# ------------------------------
mkdir -p $BASE_DIR
if [ ! -d "$BASE_DIR/.git" ]; then
    git clone https://github.com/tylaig/init-infra.git $BASE_DIR
else
    cd $BASE_DIR && git pull
fi

cd $BASE_DIR

# ------------------------------
# Prepara portainer.yaml para cliente
# ------------------------------
sed "s/cliente/$CLIENTE/g" portainer.yaml > $BASE_DIR/portainer-$CLIENTE.yaml

# ------------------------------
# Deploy Traefik e Portainer
# ------------------------------
docker stack deploy -c traefik.yaml traefik
docker stack deploy -c $BASE_DIR/portainer-$CLIENTE.yaml portainer

echo ">>> Instalação completa para o cliente: $CLIENTE"
