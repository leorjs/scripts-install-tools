#!/bin/bash

echo "Instalando Jenkins..."
sudo apt-get update

# Verifica si wget está instalado, si no, lo instala
if ! command -v wget &> /dev/null
then
    echo "wget no está instalado. Instalando wget..."
    sudo apt-get install -y wget
fi

# Instalar Java que es un requisito previo para Jenkins
sudo apt-get install -y openjdk-11-jdk

# Agregar la llave y repositorio de Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Actualizar repositorios e instalar Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Iniciar y habilitar Jenkins en el arranque
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Verificar el estado del servicio Jenkins
echo "Verificando el estado de Jenkins..."
sudo systemctl status jenkins --no-pager

# Esperar a que Jenkins inicie completamente y obtener la clave inicial del administrador
echo "Esperando a que Jenkins complete su configuración inicial..."
sleep 60
ADMIN_PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Jenkins ha sido instalado."
echo "URL para acceder a Jenkins: http://$(hostname -I | awk '{print $1}'):8080"
echo "Clave inicial del administrador: $ADMIN_PASSWORD"

