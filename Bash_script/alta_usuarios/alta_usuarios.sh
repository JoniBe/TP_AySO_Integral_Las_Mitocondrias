#!/bin/bash

# Archivo donde se guardarán los usuarios creados
agregar_usuarios="Lista_Usuarios.txt"

# Pedir el nombre del usuario
echo "Introduce el nombre del nuevo usuario:"
read username

# Verificar si el usuario ya existe
if id "$username" &>/dev/null; then
    echo "El usuario $username ya existe."
else
    # Crear el usuario con un directorio home y una shell predeterminada
    sudo useradd -m -s /bin/bash "$username"

    # Solicitar la contraseña para el nuevo usuario
    echo "Introduce la contraseña para el usuario $username:"
    sudo passwd "$username"

    # Agregar el nombre del usuario al archivo de texto
    echo "$username" >> "$archivo_usuarios"
    echo "Usuario $username creado con éxito y guardado en $archivo_usuarios."
fi

echo "Proceso completado."
