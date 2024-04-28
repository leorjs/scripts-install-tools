#!/bin/bash

echo "Desinstalando AWS CLI..."

# Localizar el directorio de instalación de AWS CLI y desinstalarlo
if [ -d "/usr/local/aws-cli" ]; then
    sudo rm -rf /usr/local/aws-cli
fi

if [ -d "/usr/local/bin/aws" ]; then
    sudo rm /usr/local/bin/aws
fi

# Verificar si la desinstalación fue exitosa
if [ ! -f "/usr/local/bin/aws" ]; then
    echo "AWS CLI desinstalado correctamente."
else
    echo "Hubo un error desinstalando AWS CLI."
fi

echo "Proceso de desinstalación completado."

