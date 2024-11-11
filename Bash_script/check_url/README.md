# Documentacion R3 - Scripts de Gestión de Usuarios y Consultas HTTP
### Script para Crear Usuarios en Linux

Este script crea un nuevo usuario en el sistema Linux y guarda su nombre en un archivo de texto llamado Lista_Usuarios.txt.
Instrucciones para Ejecutar el Script:
1. Guardar el Script: Guarda el siguiente en el archivo crear_usuario.sh.

```bash
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
    echo "$username" >> "$agregar_usuarios"
    echo "Usuario $username creado con éxito y guardado en $agregar_usuarios."
fi

echo "Proceso completado."
```

2. Dar Permisos de Ejecución: Asigna permisos de ejecución al script:

```bash
chmod 777 crear_usuario.sh
```
3. Ejecutar el Script: Ejecuta el script proporcionando el nombre del nuevo usuario:

```bash
sudo ./crear_usuario.sh
```
### Proceso del Script:
Si el usuario ya existe en el sistema, el script muestra un mensaje y no realiza cambios.
Creación de Usuario: Si el usuario no existe, el script crea el usuario, le asigna una contraseña y guarda su nombre en Lista_Usuarios.txt.
### Script para Consultar una URL y Guardar la Respuesta

Este script realiza una consulta HTTP a una URL proporcionada como argumento y guarda la respuesta en un archivo llamado Lista_URL.txt.

Instrucciones para Ejecutar el Script
1. Guardar el Script: Guarda el siguiente código en un archivo, por ejemplo consultar_url.sh.
```bash
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
```
2. Dar Permisos de Ejecución: Asigna permisos de ejecución al script:

```bash
chmod +x consultar_url.sh
```

3. Ejecutar el Script: Ejecuta el script pasando una URL como argumento:

```bash
./consultar_url.sh http://example.com
```
### Proceso del Script:
Si no se pasa ninguna URL, el script muestra un mensaje de error y termina.
Consulta HTTP: Usa curl para hacer una solicitud GET a la URL proporcionada y guarda la respuesta en el archivo Lista_URL.txt.
