#!/bin/bash

PORTAINER_URL=$1

if [ -z "$PORTAINER_URL" ]; then
  echo "Usage: $0 <portainer_url>"
  exit 1
fi

echo ">>> Conferência do servidor iniciado para URL: $PORTAINER_URL"

RESULTS=()

# Docker
if command -v docker &> /dev/null; then
  RESULTS+=("{\"docker_instalado\": true}")
else
  RESULTS+=("{\"docker_instalado\": false}")
fi

# Docker daemon
if systemctl is-active --quiet docker; then
  RESULTS+=("{\"docker_daemon_rodando\": true}")
else
  RESULTS+=("{\"docker_daemon_rodando\": false}")
fi

# Swarm
SWARM_STATUS=$(docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || echo "unknown")
RESULTS+=("{\"swarm_status\": \"$SWARM_STATUS\"}")

# Volumes
VOLUMES=("portainer_data" "volume_swarm_shared" "volume_swarm_certificates")
for vol in "${VOLUMES[@]}"; do
  if docker volume ls -q | grep -q "^$vol$"; then
    RESULTS+=("{\"volume_$vol\": true}")
  else
    RESULTS+=("{\"volume_$vol\": false}")
  fi
done

# Stacks
STACKS=("portainer" "traefik")
for stack in "${STACKS[@]}"; do
  if docker stack ls 2>/dev/null | grep -q "^$stack"; then
    RESULTS+=("{\"stack_$stack\": true}")
  else
    RESULTS+=("{\"stack_$stack\": false}")
  fi
done

# Teste Portainer via URL
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $PORTAINER_URL || echo "erro")
if [ "$HTTP_STATUS" == "200" ]; then
  RESULTS+=("{\"portainer_status\": \"OK\", \"http_code\": $HTTP_STATUS}")
else
  RESULTS+=("{\"portainer_status\": \"NÃO OK\", \"http_code\": \"$HTTP_STATUS\"}")
fi

# Output JSON
echo "{"
echo "  \"check_results\": ["
echo "    $(IFS=,; echo "${RESULTS[*]}")"
echo "  ]"
echo "}"
