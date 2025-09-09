# Exemplos de Uso do Parâmetro --clean-install

## ✅ **Novo Parâmetro Implementado**

### **`--clean-install` ou `-c`**
Remove completamente o Docker e todas suas dependências antes da instalação, garantindo uma instalação limpa.

## 🧹 **O que a limpeza faz:**

1. **Para todos os containers** em execução
2. **Remove todos os containers** (parados e em execução)
3. **Remove todas as imagens** Docker
4. **Remove todos os volumes** Docker
5. **Remove redes customizadas**
6. **Remove stacks do Portainer**
7. **Para serviços Docker** (docker, docker.socket, containerd)
8. **Remove Docker e dependências** completamente
9. **Remove diretórios** do Docker (/var/lib/docker, /etc/docker, etc.)
10. **Remove grupos** Docker
11. **Limpa cache** do apt

## 🚀 **Exemplos de Uso**

### **1. Instalação Limpa do Portainer:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --clean-install --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_'
```

### **2. Instalação Limpa via SSH:**
```bash
ssh root@meuservidor.com 'bash -s' < <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --clean-install --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_'
```

### **3. Para n8n (comando completo):**
```bash
bash -c "
CLIENTE=paulo
DOMAIN=portainer.paulo.meusuper.app
USER_ADMIN=admin
PASSWORD_ADMIN=Samuel@0221
SERVER_NAME=paulo-MSAPP
NETWORK=paulo-MSAPP-REDE
EMAIL_ADMIN=contato@meusuper.app
curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup | bash -s -- --clean-install --auto --menu 1 --domain \"\$DOMAIN\" --user \"\$USER_ADMIN\" --password \"\$PASSWORD_ADMIN\" --server-name \"\$SERVER_NAME\" --network \"\$NETWORK\" --email \"\$EMAIL_ADMIN\"
"
```

### **4. Instalação Limpa do Chatwoot:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --clean-install --auto --menu 2 --domain chatwoot.exemplo.com --user admin --password '@Senha123456_' --email 'admin@exemplo.com' --db-name 'chatwoot' --db-user 'chatwoot' --db-password '@SenhaDB123'
```

### **5. Instalação Limpa do MinIO:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --clean-install --auto --menu 6 --domain minio.exemplo.com --bucket-name 'meubucket' --access-key 'minioadmin' --secret-key '@SenhaMinIO123'
```

### **6. Modo Silencioso com Limpeza:**
```bash
bash <(curl -sSL https://raw.githubusercontent.com/tylaig/init-infra/main/Setup) --clean-install --quiet --return-data --auto --menu 1 --domain portainer.exemplo.com --user admin --password '@Senha123456_'
```

## 📋 **Parâmetros Disponíveis**

| Parâmetro | Descrição | Exemplo |
|-----------|-----------|---------|
| `--clean-install` | Remove Docker completamente | `--clean-install` |
| `-c` | Versão curta do clean-install | `-c` |
| `--auto` | Modo automático | `--auto` |
| `--menu N` | Instala aplicação específica | `--menu 1` |
| `--domain` | Domínio da aplicação | `--domain "portainer.exemplo.com"` |
| `--user` | Usuário da aplicação | `--user "admin"` |
| `--password` | Senha da aplicação | `--password "@Senha123"` |

## ⚠️ **Avisos Importantes**

### **⚠️ ATENÇÃO:**
- **A limpeza remove TUDO** relacionado ao Docker
- **Todos os containers serão perdidos**
- **Todos os volumes serão perdidos**
- **Todas as imagens serão perdidas**
- **Todas as configurações serão perdidas**

### **✅ Quando usar:**
- **Problemas com Docker** corrompido
- **Conflitos de versão** do Docker
- **Instalação limpa** em servidor usado
- **Reset completo** do ambiente Docker
- **Migração** para nova versão do Docker

### **❌ Quando NÃO usar:**
- **Servidor em produção** com dados importantes
- **Containers críticos** em execução
- **Volumes com dados** importantes
- **Ambiente estável** funcionando

## 🔄 **Fluxo de Execução**

1. **🧹 Limpeza Completa** - Remove Docker e dependências
2. **📥 Download** - Baixa SetupMSAPP
3. **⚙️ Instalação** - Instala Docker limpo
4. **🚀 Aplicação** - Instala aplicação escolhida
5. **✅ Conclusão** - Retorna dados da instalação

## 📊 **Exemplo de Saída**

```
🧹 Iniciando limpeza completa do Docker...

1/8 - Parando todos os containers...
2/8 - Removendo todos os containers...
3/8 - Removendo todas as imagens Docker...
4/8 - Removendo todos os volumes...
5/8 - Removendo redes customizadas...
6/8 - Removendo stacks do Portainer...
7/8 - Parando serviço Docker...
8/8 - Removendo Docker e dependências...

✅ Limpeza completa do Docker concluída!
🔄 Sistema pronto para nova instalação limpa

Download concluído com sucesso!
Executando SetupMSAPP com parâmetros...
Argumentos: --auto --menu 1 --domain portainer.exemplo.com --user admin --password @Senha123456_

[Instalação da aplicação...]

✅ Instalação concluída!
```

## 🎯 **Status**

✅ **Parâmetro --clean-install implementado!**
✅ **Funciona em ambos os scripts (Setup e SetupMSAPP)!**
✅ **Limpeza completa e segura!**
✅ **Perfeito para instalações limpas!**
✅ **Ideal para resolver problemas do Docker!**

**Agora você pode fazer instalações completamente limpas removendo todo o Docker antes da instalação!** 🚀
