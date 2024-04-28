#!/bin/bash

echo "Instalando Argo CD en MicroK8s..."
microk8s.kubectl create namespace argocd
microk8s.kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Esperando que los pods de Argo CD estén listos..."
microk8s.kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=180s

echo "Configurando Ingress para el dashboard de Argo CD..."
cat <<EOF | microk8s.kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: argocd-server-ingress
  namespace: argocd
spec:
  rules:
  - host: "argocd.local"
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: argocd-server
            port:
              number: 80
EOF

echo "Extrayendo la contraseña inicial para el usuario admin de Argo CD..."
ARGO_PWD=$(microk8s.kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode)

echo "Argo CD ha sido instalado correctamente en MicroK8s."
echo "Agrega a tu archivo /etc/hosts: 127.0.0.1 argocd.local"
echo "Puedes acceder al dashboard de Argo CD en: http://argocd.local"
echo "Usuario: admin"
echo "Contraseña inicial: $ARGO_PWD"
echo "Nota: Asegúrate de cambiar la contraseña inicial lo antes posible por razones de seguridad."

