-Documentación para curzar las keys entre las máquinas de producción (Fedora) y testing (Ubuntu)-

1) Levantar las máquinas virtuales dentro de la carpeta VagrantFolder con el comando: vagrant up

2) Conectarse a la máquina de testing con el siguiente comando: vagrant ssh primero

3) Ejecutar comando de listado (Opcional): ls -l / ll

4) Ingresar en la carpeta de scripts con el siguiente comando: cd script_folders/script/

5) Ejecutar el script con el siguiente comando: ./script_cross_visudo_hosts.sh

     Este script realiza lo siguiente:

      - Nombrar las máquinas en la carpeta /etc/hosts

      - Remueve la contraseña para usar sudo

      - Cruza las keys entre las dos máquinas
        
6) Conectarse a la máquina de producción con el siguiente comando: ssh vagrant@production

7) Ejecutar comando de listado (Opcional): ls -l / ll

8) Ingresar en la carpeta de scripts con el siguiente comando: cd script_folders/script_fedora/

9) Ejecutar el script con el siguiente comando: ./script_cross_visudo_hosts.sh

     Este script realiza lo mismo que el punto 5 pero en la máquina de producción

10) Podés alternar entre las máquinas con los siguientes comandos:

    -  ssh vagrant@production --> Para ir a la máquina de producción (Fedora)
   
    -  ssh vagrant@testing --> Para ir a la máquina de testing (ubuntu)

- INFO DISCOS -

  Dentro de la carpeta de script en ambas máquinas se encuentra un script llamado "script_discos.sh" que particiona los discos y crea los LVMs correspondientes. Ya tienen permiso de ejecución, solo hay que ejecutarlos.

  Ejecutarlos con el siguiente comando (Opcional): ./script_discos.sh
