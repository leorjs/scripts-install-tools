#!/bin/bash

# Verificar e instalar unzip si es necesario
if ! command -v unzip &> /dev/null
then
    echo "unzip no está instalado. Instalando unzip..."
    sudo apt-get update
    sudo apt-get install -y unzip
fi

# Descargar AWS CLI
echo "Descargando AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Descomprimir el archivo descargado
echo "Instalando AWS CLI..."
unzip awscliv2.zip
sudo ./aws/install

# Verificar y mostrar la versión de AWS CLI instalada
echo "Verificación de la instalación de AWS CLI:"
aws --version

# Mostrar estado de la instalación
if [ $? -eq 0 ]; then
    echo "AWS CLI instalado correctamente."
else
    echo "Hubo un error instalando AWS CLI."
fi

