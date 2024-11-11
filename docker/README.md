# Docker - Documentación

### Generar image

Usar . si se corre dentro de la carpeta docker

```bash
docker build -t tp-313_las-mitocondrias .
```

### Crear cuenta y repositorio en Docker Hub

https://hub.docker.com/

Crear un repositorio con el nombre **tp-313_las-mitocondrias**

### Obtener Access Token desde Docker Hub

1. En Docker Hub, ir a **Account Settings** -> **Security** -> **Personal Access Token**

2. Crear un nuevo token con permisos de **Read, Write, Delete**

3. Copiar el token generado y guardarlo (no se puede volver a ver)

### Loguearse en Docker Hub

```bash
docker login -u "USUARIO" docker.io
```

Les va a pedir la contraseña, que es el token generado en el paso anterior.

### Cambiar tag de su imagen para que coincida con el repositorio de Docker Hub

```bash
docker tag tp-313_las-mitocondrias USUARIO/tp-313_las-mitocondrias
```

### Listar las imágenes

```bash
docker images
```

Les debería salir lo siguiente:

| REPOSITORY | TAG | IMAGE ID | CREATED | SIZE |
| ---------- | --- | -------- | ------- | ---- |
| USUARIO/tp-313_las-mitocondrias | latest | a48e6518f9e7 | 21 hours ago | 197MB |

### Subir la imagen a Docker Hiub

```bash
docker push USUARIO/tp-313_las-mitocondrias
```


### Levantar servidor docker-compose

en la carpeta docker donde se encuentra docker-compose.yml levantar servidor en segundo plano

```bash
docker-compose.yml up -d
```
