#!/bin/bash
clear

LISTA=Lista_Usuarios.txt

if [[ -z $LISTA ]]; then
    echo "Error: Debes proporcionar un archivo de lista de usuarios como parámetro."
    exit 1
fi

if [[ ! -f $LISTA ]]; then
    echo "Error: El archivo $LISTA no existe."
    exit 1
fi

ANT_IFS=$IFS
IFS=$'\n'

for LINEA in $(cat $LISTA | grep -v '^#'); do
    # Separar campos por coma
    USUARIO=$(echo $LINEA | awk -F ',' '{print $1}')
    GRUPO=$(echo $LINEA | awk -F ',' '{print $2}')
    DIR_HOME=$(echo $LINEA | awk -F ',' '{print $3}')

    # Crear grupo si no existe
    if ! grep -q "^$GRUPO:" /etc/group; then
        echo "Creando grupo $GRUPO..."
        sudo groupadd $GRUPO
    fi

    # Crear usuario con grupo y directorio home
    echo "Creando usuario $USUARIO con grupo $GRUPO y home $DIR_HOME..."
    sudo useradd -m -s /bin/bash -g $GRUPO -d $DIR_HOME $USUARIO

    # Configurar permisos del directorio home
    if [[ -d $DIR_HOME ]]; then
        echo "Configurando permisos para $DIR_HOME..."
        sudo chown $USUARIO:$GRUPO $DIR_HOME
        sudo chmod 750 $DIR_HOME
    fi
done

IFS=$ANT_IFS

echo "Proceso de creación de usuarios finalizado."
