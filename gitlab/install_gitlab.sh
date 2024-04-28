#!/bin/bash
echo "Instalando GitLab..."

# Actualizar los paquetes del sistema
sudo apt-get update

# Instalar curl si no está presente
if ! command -v curl &> /dev/null
then
    echo "curl no está instalado. Instalando curl..."
    sudo apt-get install -y curl
fi

# Obtener la dirección IP pública del servidor
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Descargar e instalar GitLab usando la IP pública
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://${IP_ADDRESS}" apt-get install gitlab-ee

# Configurar GitLab
sudo gitlab-ctl reconfigure

# Asegurarse de que el puerto 80 está abierto en el firewall
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw reload

# Esperar a que GitLab inicie completamente y mostrar la contraseña inicial del administrador
echo "Esperando a que GitLab inicie y se configure completamente..."
sleep 120  # Esperar 2 minutos para asegurarse de que todo está listo
echo "La instalación de GitLab ha finalizado."
echo "Accede al dashboard de GitLab en: http://${IP_ADDRESS}"
echo "El usuario seria --> root"

# Mostrar la contraseña del administrador
echo "Recuperando la contraseña inicial del administrador de GitLab..."
sudo cat /etc/gitlab/initial_root_password

