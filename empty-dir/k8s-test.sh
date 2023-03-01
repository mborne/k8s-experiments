#!/bin/bash

DEVBOX_HOSTNAME=${DEVBOX_HOSTNAME:-dev.localhost}

# Create namespace empty-dir if not exists
kubectl create namespace empty-dir --dry-run=client -o yaml | kubectl apply -f -

# Deploy empty-dir with helm
kubectl -n empty-dir apply -k manifests

# Create Ingress with dynamic hostname
cat <<EOF | kubectl -n empty-dir apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: empty-dir
spec:
  rules:
  - host: empty-dir.$DEVBOX_HOSTNAME
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: empty-dir
            port:
              number: 80
EOF

sleep 10

# récupération du nom du pod dans index.html
for i in {1..5};
do
  echo "# GET http://empty-dir.${DEVBOX_HOSTNAME} ..."
  curl -sS -x "" "http://empty-dir.${DEVBOX_HOSTNAME}"
done

# récupération des logs
for POD_NAME in $(kubectl -n empty-dir get pods -o name);
do
  echo "# $POD_NAME - /bin/cat /var/log/nginx/access.log"
  kubectl -n empty-dir exec -t $POD_NAME -- /bin/cat /var/log/nginx/access.log
done

