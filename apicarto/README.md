# k8s-apicarto

**ATTENTION : Pour démonstration d'utilisation de K8S, ne pas utiliser**

## Déployer

```bash
kubectl create namespace apicarto-test
kubectl -n apicarto-test apply -k apicarto/manifest
# ou
#kubectl -n apicarto-test apply -k https://github.com/mborne/k8s-experiments/apicarto/manifest
```

## Vérifier

```bash
# Lister les pods et les services
kubectl -n apicarto-test get pods,svc

# Pour http://127.0.0.1:8888/api/doc
kubectl -n apicarto-test port-forward svc/apicarto 8888:80
```

