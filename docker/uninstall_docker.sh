#!/bin/bash

# Detener todos los contenedores Docker activos
echo "Deteniendo todos los contenedores Docker..."
sudo docker stop $(sudo docker ps -aq)

# Eliminar todos los contenedores Docker
echo "Eliminando todos los contenedores Docker..."
sudo docker rm $(sudo docker ps -aq)

# Eliminar todas las imágenes Docker
echo "Eliminando todas las imágenes Docker..."
sudo docker rmi -f $(sudo docker images -aq)

# Eliminar todos los volúmenes Docker
echo "Eliminando todos los volúmenes Docker..."
sudo docker volume rm $(sudo docker volume ls -q)

# Eliminar todas las redes Docker
echo "Eliminando todas las redes Docker..."
sudo docker network rm $(sudo docker network ls -q)

# Eliminar Docker Engine, CLI y Containerd
echo "Desinstalando Docker Engine, CLI y Containerd..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io

# Eliminar directorios creados por Docker
echo "Eliminando directorios creados por Docker..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd


# Limpiar paquetes no necesarios y actualizar la lista de paquetes
echo "Limpiando paquetes no necesarios y actualizando lista de paquetes..."
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get update

echo "Docker ha sido completamente desinstalado del sistema."

