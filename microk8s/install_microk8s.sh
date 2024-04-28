#!/bin/bash

echo "Verificando requisitos del sistema..."
# Agrega aquí comandos para verificar CPU, RAM, etc., si lo consideras necesario

echo "Instalando dependencias necesarias..."
sudo apt-get update && sudo apt-get install -y snapd

echo "Instalando MicroK8s..."
sudo snap install microk8s --classic

echo "Verificando la instalación de Snap y MicroK8s..."
if ! command -v snap &> /dev/null || ! snap list microk8s &> /dev/null; then
    echo "Hubo un problema instalando MicroK8s."
    exit 1
fi

echo "Configurando MicroK8s..."
sudo microk8s.enable dns dashboard hostpath-storage

echo "Añadiendo el usuario al grupo microk8s..."
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

echo "Configurando alias para kubectl..."
echo "alias kubectl='microk8s kubectl'" >> ~/.bashrc
echo "Se ha configurado el alias 'kubectl' para que ejecute 'microk8s kubectl'. Puedes empezar a usarlo reiniciando tu sesión terminal o ejecutando 'source ~/.bashrc'."

echo "Aplicando cambios de grupo..."
newgrp microk8s

echo "Iniciando MicroK8s..."
sudo microk8s.start

echo "Comprobando el estado de MicroK8s..."
sudo microk8s.status --wait-ready

echo "MicroK8s ha sido instalado y configurado correctamente."
echo "Puedes acceder al dashboard ejecutando: microk8s dashboard-proxy"
echo "Usa 'microk8s stop' para detener MicroK8s y 'microk8s start' para iniciar."

