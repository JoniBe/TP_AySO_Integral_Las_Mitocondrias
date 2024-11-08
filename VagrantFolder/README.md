# Documentación - VMs

### Cruzar keys entre máquinas de producción (Fedora) y testing (Ubuntu)

1. Dentro de VagrantFolder ejecutar el siguiente comando para levantar las VMs:

     ```bash
     vagrant up
     ```

2. Conectarse a la máquina de testing con el siguiente comando: 

     ```bash
     vagrant ssh primero
     ```

3. Ejecutar comando de listado (Opcional): 

     ```bash
     ls -l / ll
     ```

4. Ingresar en el directorio ***scripts*** con el siguiente comando: 

     ```bash
     cd script_folders/script/
     ```

5. Ejecutar el script con el siguiente comando: 

     ```bash
     ./script_cross_visudo_hosts.sh
     ```

     >Este script realiza lo siguiente:
     >
     >- Nombrar las máquinas en la carpeta /etc/hosts
     >
     >- Remueve la contraseña para usar sudo
     >
     >- Cruza las keys entre las dos máquinas
        
6. Conectarse a la máquina de producción con el siguiente comando: 

     ```bash
     ssh vagrant@production
     ```

7. Ejecutar comando de listado (Opcional): 

     ```bash
     ls -l / ll
     ```

8. Ingresar en el directorio ***scripts*** con el siguiente comando: 

     ```bash
     cd script_folders/script_fedora/
     ```

9. Ejecutar el script con el siguiente comando: 

     ```bash
     ./script_cross_visudo_hosts.sh
     ```
     > Este script realiza lo mismo que el punto 5 pero en la máquina de producción

10. Podés alternar entre las máquinas con los siguientes comandos:

- Producción (Fedora):
     ```bash
     ssh vagrant@production
     ```
- Testing (Ubuntu):
     ```bash  
    ssh vagrant@testing
    ```

### DISCOS

Dentro del directorio  **scripts** en ambas máquinas se encuentra un script llamado **script_discos.sh** que particiona los discos y crea los LVMs correspondientes. Ya tienen permiso de ejecución, solo hay que ejecutarlos con el siguiente comando (opcional):

```bash
./script_discos.sh
```