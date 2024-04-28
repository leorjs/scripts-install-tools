#!/bin/bash
echo "Instalando Terraform..."
sudo apt-get update

# Verifica si curl está instalado, si no, lo instala
if ! command -v curl &> /dev/null
then
    echo "curl no está instalado. Instalando curl..."
    sudo apt-get install -y curl
fi

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install -y terraform
echo "Terraform instalado."

