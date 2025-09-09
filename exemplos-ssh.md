# Exemplos de Uso do SetupMSAPP via SSH

## Visão Geral

O SetupMSAPP agora suporta execução completa via SSH com parâmetros CLI, permitindo instalação automática sem interação manual.

## Sintaxe Básica

```bash
ssh user@server 'bash -s' < SetupMSAPP --auto [APLICAÇÃO] [PARÂMETROS]
```

## Exemplos Práticos

### 1. Instalar Portainer (Traefik & Portainer)

```bash
ssh root@meuservidor.com 'bash -s' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com'
```

**Parâmetros necessários:**
- `--domain`: URL do Portainer
- `--user`: Usuário admin
- `--password`: Senha (mínimo 12 caracteres)
- `--server-name`: Nome do servidor
- `--network`: Rede interna
- `--email`: Email do administrador

### 2. Instalar Chatwoot

```bash
ssh root@meuservidor.com 'bash -s' < SetupMSAPP --auto 02 --domain chatwoot.exemplo.com --db-name chatwoot --db-user chatwoot --db-password '@Senha123456_' --admin-email 'admin@exemplo.com' --admin-password '@Senha123456_'
```

**Parâmetros necessários:**
- `--domain`: URL do Chatwoot
- `--db-name`: Nome do banco de dados
- `--db-user`: Usuário do banco
- `--db-password`: Senha do banco
- `--admin-email`: Email do admin
- `--admin-password`: Senha do admin

### 3. Instalar N8N

```bash
ssh root@meuservidor.com 'bash -s' < SetupMSAPP --auto 08 --domain n8n.exemplo.com --db-name n8n --db-user n8n --db-password '@Senha123456_'
```

**Parâmetros necessários:**
- `--domain`: URL do N8N
- `--db-name`: Nome do banco de dados
- `--db-user`: Usuário do banco
- `--db-password`: Senha do banco

### 4. Instalar MinIO

```bash
ssh root@meuservidor.com 'bash -s' < SetupMSAPP --auto 06 --domain minio.exemplo.com --bucket-name 'meu-bucket' --access-key 'MINIOACCESS' --secret-key 'minio-secret-key-123456'
```

**Parâmetros necessários:**
- `--domain`: URL do MinIO
- `--bucket-name`: Nome do bucket padrão
- `--access-key`: Chave de acesso
- `--secret-key`: Chave secreta

### 5. Instalação com Retorno de Dados

```bash
ssh root@meuservidor.com 'bash -s' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com' --return-data
```

**Retorno esperado:**
```
=== DADOS DA INSTALAÇÃO ===
Timestamp: 2024-01-15 14:30:25
Aplicação: 01
Status: Instalação concluída com sucesso

URL do Portainer: https://portainer.exemplo.com
Usuário: admin
Senha: [CONFIGURADA]
Nome do Servidor: MeuServidor
Rede Interna: 192.168.1.0/24
Email Admin: admin@exemplo.com

=== FIM DOS DADOS ===
```

## Opções Disponíveis

### Flags Principais
- `--auto`: Modo automático (obrigatório para SSH)
- `--skip-license`: Pula aceitação da licença
- `--quiet`: Modo silencioso
- `--return-data`: Retorna dados após instalação

### Parâmetros de Aplicação
- `--domain`: URL/domínio da aplicação
- `--user`: Usuário (para Portainer)
- `--password`: Senha (para Portainer)
- `--server-name`: Nome do servidor
- `--network`: Rede interna
- `--email`: Email do administrador
- `--db-name`: Nome do banco de dados
- `--db-user`: Usuário do banco
- `--db-password`: Senha do banco
- `--admin-email`: Email do administrador
- `--admin-password`: Senha do administrador
- `--bucket-name`: Nome do bucket (MinIO)
- `--access-key`: Chave de acesso (MinIO)
- `--secret-key`: Chave secreta (MinIO)

## Aplicações Disponíveis

| ID | Nome | Parâmetros Principais |
|----|------|----------------------|
| 01 | Traefik & Portainer | domain, user, password, server-name, network, email |
| 02 | Chatwoot | domain, db-name, db-user, db-password, admin-email, admin-password |
| 03 | Evolution API | domain, db-name, db-user, db-password |
| 04 | Evolution API Lite | domain, db-name, db-user, db-password |
| 05 | Evolution API v2 | domain, db-name, db-user, db-password |
| 06 | MinIO | domain, bucket-name, access-key, secret-key |
| 07 | Typebot | domain, db-name, db-user, db-password |
| 08 | N8N | domain, db-name, db-user, db-password |
| 09 | Flowise | domain, db-name, db-user, db-password |
| 10 | pgAdmin 4 | domain, db-name, db-user, db-password |
| 11 | Nocobase | domain, db-name, db-user, db-password |
| 12 | Botpress | domain, db-name, db-user, db-password |
| 13 | WordPress | domain, db-name, db-user, db-password |
| 14 | Baserow | domain, db-name, db-user, db-password |
| 15 | MongoDB | domain, db-name, db-user, db-password |
| 16 | RabbitMQ | domain, db-name, db-user, db-password |
| 17 | Uptime Kuma | domain, db-name, db-user, db-password |
| 18 | Cal.com | domain, db-name, db-user, db-password |
| 19 | Mautic | domain, db-name, db-user, db-password |
| 20 | Appsmith | domain, db-name, db-user, db-password |
| 21 | Qdrant | domain, db-name, db-user, db-password |
| 22 | Woofed CRM | domain, db-name, db-user, db-password |
| 23 | Formbricks | domain, db-name, db-user, db-password |
| 24 | NocoDB | domain, db-name, db-user, db-password |
| 25 | Langfuse | domain, db-name, db-user, db-password |
| 26 | Metabase | domain, db-name, db-user, db-password |
| 27 | Odoo | domain, db-name, db-user, db-password |
| 28 | Chatwoot Nestor | domain, db-name, db-user, db-password |
| 29 | UnoAPI | domain, db-name, db-user, db-password |
| 30 | N8N QuePasa | domain, db-name, db-user, db-password |
| 31 | QuePasa | domain, db-name, db-user, db-password |

## Scripts de Automação

### Script para Instalar Múltiplas Aplicações

```bash
#!/bin/bash

SERVER="root@meuservidor.com"
SCRIPT_PATH="./SetupMSAPP"

# Instalar Portainer
echo "Instalando Portainer..."
ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 01 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com' --return-data

# Instalar Chatwoot
echo "Instalando Chatwoot..."
ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 02 --domain chatwoot.exemplo.com --db-name chatwoot --db-user chatwoot --db-password '@Senha123456_' --admin-email 'admin@exemplo.com' --admin-password '@Senha123456_' --return-data

# Instalar N8N
echo "Instalando N8N..."
ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 08 --domain n8n.exemplo.com --db-name n8n --db-user n8n --db-password '@Senha123456_' --return-data

echo "Todas as instalações concluídas!"
```

### Script para n8n

```bash
#!/bin/bash

# Configurações
SERVER="root@meuservidor.com"
SCRIPT_PATH="./SetupMSAPP"
APP_ID="$1"  # Recebe o ID da aplicação como parâmetro
DOMAIN="$2"  # Recebe o domínio como parâmetro

case $APP_ID in
    "01")
        ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 01 --domain $DOMAIN --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com' --return-data
        ;;
    "02")
        ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 02 --domain $DOMAIN --db-name chatwoot --db-user chatwoot --db-password '@Senha123456_' --admin-email 'admin@exemplo.com' --admin-password '@Senha123456_' --return-data
        ;;
    "08")
        ssh $SERVER 'bash -s' < $SCRIPT_PATH --auto 08 --domain $DOMAIN --db-name n8n --db-user n8n --db-password '@Senha123456_' --return-data
        ;;
    *)
        echo "Aplicação não reconhecida: $APP_ID"
        exit 1
        ;;
esac
```

## Troubleshooting

### Problemas Comuns

1. **Erro de conexão SSH**
   ```bash
   # Verificar conectividade
   ssh -o ConnectTimeout=10 root@meuservidor.com 'echo "Conexão OK"'
   ```

2. **Script não encontrado**
   ```bash
   # Verificar se o script existe no servidor
   ssh root@meuservidor.com 'ls -la SetupMSAPP'
   ```

3. **Permissões insuficientes**
   ```bash
   # Dar permissão de execução
   ssh root@meuservidor.com 'chmod +x SetupMSAPP'
   ```

4. **Parâmetros inválidos**
   ```bash
   # Verificar ajuda
   ssh root@meuservidor.com 'bash -s' < SetupMSAPP --help
   ```

### Logs e Debug

```bash
# Executar com debug
ssh root@meuservidor.com 'bash -x' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com'
```

## Segurança

### Boas Práticas

1. **Use chaves SSH** em vez de senhas
2. **Limite acesso** por IP quando possível
3. **Use senhas fortes** (mínimo 12 caracteres)
4. **Monitore logs** de instalação
5. **Faça backup** antes de instalar

### Exemplo com Chave SSH

```bash
# Usar chave SSH específica
ssh -i ~/.ssh/id_rsa root@meuservidor.com 'bash -s' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com'
```

## Integração com CI/CD

### GitHub Actions

```yaml
name: Deploy Application
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy Portainer
        run: |
          ssh -o StrictHostKeyChecking=no root@${{ secrets.SERVER_IP }} 'bash -s' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '${{ secrets.PORTAINER_PASSWORD }}' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com' --return-data
```

### GitLab CI

```yaml
deploy:
  script:
    - ssh -o StrictHostKeyChecking=no root@$SERVER_IP 'bash -s' < SetupMSAPP --auto 01 --domain portainer.exemplo.com --user admin --password '$PORTAINER_PASSWORD' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com' --return-data
```
