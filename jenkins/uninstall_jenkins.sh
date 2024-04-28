# Detener el servicio Jenkins
sudo systemctl stop jenkins

# Deshabilitar el servicio para que no se inicie automáticamente en el arranque
sudo systemctl disable jenkins

# Desinstalar el paquete Jenkins
sudo apt-get remove --purge -y jenkins

# Limpiar paquetes no necesarios
sudo apt-get autoremove -y

# Eliminar los archivos de configuración y datos de Jenkins
sudo rm -rf /var/lib/jenkins
sudo rm -rf /var/cache/jenkins
sudo rm -rf /etc/default/jenkins

# Eliminar el repositorio de Jenkins si ya no lo necesitas
sudo rm /etc/apt/sources.list.d/jenkins.list
sudo apt-get update

