#!/bin/bash

# Actualizar los paquetes del sistema
echo "Actualizando paquetes del sistema..."
sudo apt-get update
sudo apt-get upgrade -y

# Instalar dependencias necesarias
echo "Instalando dependencias..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la llave GPG de Docker
echo "Agregando la llave GPG de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Agregar el repositorio de Docker al sistema
echo "Agregando el repositorio de Docker..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualizar el índice de paquetes e instalar Docker CE
echo "Instalando Docker CE..."
sudo apt-get update
sudo apt-get install -y docker-ce

# Habilitar y empezar Docker
echo "Habilitando y iniciando Docker..."
sudo systemctl enable docker
sudo systemctl start docker

# Verificar el estado de Docker
echo "Verificando el estado de Docker..."
sudo systemctl status docker --no-pager

# Agregar usuario al grupo docker para permitir la ejecución sin sudo
echo "Agregando el usuario $(whoami) al grupo docker..."
sudo usermod -aG docker $(whoami)

# Descargar y ejecutar una imagen de demostración de Mario Bros en Docker
echo "Descargando y ejecutando una imagen de demostración de Mario Bros en el puerto 8888..."
sudo docker run -d -p 8888:80 pengbai/docker-supermario

# Mostrar la URL de acceso a la aplicación
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "La instalación de Docker ha finalizado. Accede a la demo de Mario Bros en: http://${IP_ADDRESS}:8888"

# Recordatorio para cerrar sesión y volver a iniciarla
echo "Por favor, cierra sesión y vuelve a iniciarla para que los cambios de grupo tengan efecto."

