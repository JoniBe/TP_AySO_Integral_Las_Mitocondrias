#!/bin/bash

# Verificar si se pasó una URL como argumento
if [ -z "$1" ]; then
    echo "Por favor, pasa una URL como argumento."
    echo "Uso: $0 <URL>"
    exit 1
fi

# URL recibida como argumento
url="$1"

# Archivo donde se guardará la respuesta
archivo_respuesta="Lista_URL.txt"

# Realizar la consulta HTTP a la URL usando curl y guardar la respuesta
echo "Consultando la URL: $url"

# Usamos curl para hacer la solicitud y guardamos la respuesta en el archivo
curl -s "$url" -o "$archivo_respuesta"

# Verificar si el archivo fue creado correctamente
if [ -f "$archivo_respuesta" ]; then
    echo "La respuesta de la URL $url ha sido guardada en $archivo_respuesta."
else
    echo "Hubo un error al intentar guardar la respuesta de la URL."
fi

