#!/bin/bash
#Nombrar las maquinas en el host
echo "192.168.56.4 testing" | sudo tee -a /etc/hosts
echo "192.168.56.5 production" | sudo tee -a /etc/hosts

#Remover contraseña al usar sudo
if sudo grep -q "^vagrant ALL=(ALL) NOPASSWD:ALL" /etc/sudoers; then
    echo "La configuración de sudo sin contraseña ya está aplicada."
else
    echo "Agregando configuración de sudo sin contraseña para el usuario vagrant..."
    echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo
fi

# Variables de configuración
VM1_IP="192.168.56.4"     # IP de la primera máquina virtual
VM2_IP="192.168.56.5"     # IP de la segunda máquina virtual
VM_USER="vagrant"

# Generar la clave SSH en la VM si no existe
generar_clave_ssh() {
    local ip=$1
    ssh $VM_USER@$ip "if [ ! -f ~/.ssh/id_rsa ]; then ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''; fi"
}

# Copiar clave pública de una VM a la otra
copiar_clave() {
    local from_ip=$1
    local to_ip=$2

    # Obtener la clave pública desde la VM origen
    clave_pub=$(ssh $VM_USER@$from_ip "cat ~/.ssh/id_rsa.pub" | tr -d '\r')

    # Añadir la clave pública en la VM destino
    ssh $VM_USER@$to_ip "echo '$clave_pub' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
}

# Generar claves SSH si no existen
echo "Generando claves SSH en $VM1_IP y $VM2_IP si no existen..."
generar_clave_ssh $VM1_IP
generar_clave_ssh $VM2_IP

# Cruzar las claves SSH
echo "Cruzando claves SSH entre $VM1_IP y $VM2_IP..."
copiar_clave $VM1_IP $VM2_IP
copiar_clave $VM2_IP $VM1_IP

echo "Proceso completado. Ahora las máquinas pueden accederse mutuamente sin clave."

