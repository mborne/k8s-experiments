# NetworkPolicies

## Create playground with two namespaces

```bash
# create first namespace with exposed nginx deployment
kubectl create namespace one
kubectl -n one create deployment nginx --image=nginx --port=80
kubectl -n one expose deployment nginx --port=80 --target-port=80
# add frontend label to nginx pods
kubectl -n one patch deployment nginx -p '{"spec":{"template":{"metadata":{"labels":{"type":"frontend"}}}}}'

# create second namespace with terminal pod
kubectl create namespace two
kubectl -n two run terminal --image=ghcr.io/mborne/terminal --restart=Never

kubectl -n two wait --for=condition=Ready pod/terminal

# test nginx access
kubectl -n two exec -ti terminal -- /bin/sh -c "curl -sS http://nginx.one.svc.cluster.local"
# test external access
kubectl -n two exec -ti terminal -- /bin/sh -c "curl -sS https://api.ipify.org?format=json"
```




