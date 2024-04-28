#!/bin/bash

echo "Desinstalando Argo CD de MicroK8s..."
microk8s.kubectl delete namespace argocd

echo "Verificando que todos los recursos de Argo CD han sido eliminados..."
if microk8s.kubectl get namespace | grep -q 'argocd'; then
    echo "Algunos recursos de Argo CD no se han eliminado correctamente."
else
    echo "Argo CD ha sido desinstalado correctamente."
fi

