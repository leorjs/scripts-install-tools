#!/bin/bash

echo "Deteniendo MicroK8s..."
sudo microk8s.stop

echo "Desinstalando MicroK8s..."
sudo snap remove microk8s

echo "Limpiando configuraciones residuales..."
sudo rm -rf ~/.kube       # Borrar configuraciones locales de kubectl.


echo "Proceso de desinstalación completado. MicroK8s ha sido eliminado del sistema."

