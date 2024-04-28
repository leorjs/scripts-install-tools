#!/bin/bash
echo "Desinstalando Terraform..."
sudo apt-get remove --purge -y terraform
sudo apt-get autoremove -y
sudo apt-get autoclean
echo "Terraform desinstalado."

