#!/bin/bash

# Variables de configuración
USER="vagrant"
TARGET_IP="192.168.56.5"
SSH_KEY="/home/$USER/.ssh/id_rsa"

if [ ! -f "$SSH_KEY" ]; then
    echo "Generando clave SSH para el usuario $USER..."
    sudo -u $USER ssh-keygen -t rsa -b 2048 -f $SSH_KEY -N ""
fi

echo "Copiando la clave pública a $TARGET_IP..."
sudo -u $USER sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no $USER@$TARGET_IP
