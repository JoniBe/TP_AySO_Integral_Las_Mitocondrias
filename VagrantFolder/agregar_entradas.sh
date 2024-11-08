#!/bin/bash
HOSTS_ENTRY="
192.168.56.4 ubuntu-testing
192.168.56.5 fedora-production
"

if ! grep -q "192.168.56.4 ubuntu-testing" /etc/host; then
	echo "Configurando la resolución de nombres en /etc/host"
	echo "$HOSTS_ENTRY" | sudo tee -a /etc/host > /dev/null
else
	echo "Las entradas ya existen"
fi