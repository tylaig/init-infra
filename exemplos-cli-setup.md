# Exemplos de Uso dos Parâmetros CLI - Setup

## ✅ **Parâmetros CLI Suportados**

### **Parâmetros Gerais:**
- `--auto` - Modo automático (aceita termos automaticamente)
- `--skip-license` - Pula aceitação de termos
- `--quiet` - Modo silencioso (menos output)
- `--return-data` - Retorna dados da instalação
- `--help` - Mostra ajuda completa
- `--version` - Mostra versão do script

### **Parâmetros de Aplicação:**
- `--menu N` - Instala aplicação específica (N = número)

### **Parâmetros de Configuração:**
- `--domain DOMAIN` - Domínio da aplicação
- `--user USER` - Usuário da aplicação
- `--password PASS` - Senha da aplicação
- `--server-name NAME` - Nome do servidor
- `--network NETWORK` - Rede (ex: 192.168.1.0/24)
- `--email EMAIL` - Email de administração
- `--db-name DBNAME` - Nome do banco de dados
- `--db-user DBUSER` - Usuário do banco de dados
- `--db-password DBPASS` - Senha do banco de dados
- `--admin-email ADMIN_EMAIL` - Email do administrador
- `--admin-password ADMIN_PASS` - Senha do administrador
- `--bucket-name BUCKET` - Nome do bucket (MinIO/S3)
- `--access-key ACCESS_KEY` - Chave de acesso
- `--secret-key SECRET_KEY` - Chave secreta

## 🚀 **Exemplos Práticos**

### **1. Instalação Automática do Portainer:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_' --server-name 'MeuServidor' --network '192.168.1.0/24' --email 'admin@exemplo.com'
```

### **2. Instalação do Chatwoot:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --auto --menu 2 --domain chatwoot.exemplo.com --user admin --password '@Senha123456_' --email 'admin@exemplo.com' --db-name 'chatwoot' --db-user 'chatwoot' --db-password '@SenhaDB123'
```

### **3. Instalação do MinIO:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --auto --menu 6 --domain minio.exemplo.com --bucket-name 'meubucket' --access-key 'minioadmin' --secret-key '@SenhaMinIO123'
```

### **4. Instalação via SSH:**
```bash
ssh root@meuservidor.com 'bash -s' < <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_'
```

### **5. Modo Silencioso com Retorno de Dados:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --quiet --return-data --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_'
```

### **6. Verificar Ajuda:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --help
```

### **7. Verificar Versão:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --version
```

## 📋 **Aplicações Disponíveis**

| Número | Aplicação |
|--------|-----------|
| 01 | Traefik + Portainer |
| 02 | Chatwoot |
| 03 | Evolution API (WhatsApp) |
| 04 | Evolution API + Chatwoot |
| 05 | Evolution API + Chatwoot + Botpress |
| 06 | MinIO |
| 07 | Typebot |
| 08 | N8N |
| 09 | Flowise |
| 10 | PgAdmin |
| 11 | Nocobase |
| 12 | Botpress |
| 13 | WordPress |
| 14 | Baserow |
| 15 | MongoDB |
| 16 | Redis |
| 17 | PostgreSQL |
| 18 | MySQL |
| 19 | MariaDB |
| 20 | InfluxDB |
| 21 | Grafana |
| 22 | Prometheus |
| 23 | Elasticsearch |
| 24 | Kibana |
| 25 | Logstash |
| 26 | RabbitMQ |
| 27 | Apache Kafka |
| 28 | Zabbix |
| 29 | Nagios |
| 30 | OpenVPN |
| 31 | WireGuard |

## 🔧 **Como Funciona**

1. **O script Setup** processa todos os parâmetros CLI
2. **Baixa o SetupMSAPP** do repositório GitHub
3. **Passa todos os parâmetros** para o SetupMSAPP
4. **Executa a instalação** automaticamente
5. **Retorna os dados** da instalação (se solicitado)

## ✅ **Benefícios**

- **🚀 Execução automática** - Sem interação manual
- **🔧 Configuração completa** - Todos os parâmetros via CLI
- **🌐 Execução remota** - Perfeito para SSH
- **🤖 Automação** - Ideal para n8n e outros sistemas
- **📊 Retorno de dados** - Para integração com sistemas externos
- **🔇 Modo silencioso** - Para execução em background

## 🎯 **Status**

✅ **Todos os parâmetros CLI estão funcionando!**
✅ **Suporte completo para automação!**
✅ **Perfeito para execução via SSH!**
✅ **Ideal para integração com n8n!**
