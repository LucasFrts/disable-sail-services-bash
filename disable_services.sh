#!/bin/bash

# Serviços a serem verificados
services=("apache2" "mysql" "redis-server")

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "O serviço $service está rodando. Desativando..."
        sudo systemctl stop "$service"
        echo "Serviço $service desativado com sucesso."
    fi
done
