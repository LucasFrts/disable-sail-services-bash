#!/bin/bash

# Serviços a serem verificados
services=("apache2" "mysql" "redis-server")

for service in "${services[@]}"; do
    if ! systemctl is-active --quiet "$service"; then
        echo "O serviço $service está desativado. Ativando..."
        sudo systemctl start "$service"
        echo "Serviço $service ativado com sucesso."
    else
        echo "O serviço $service já está rodando."
    fi
done
