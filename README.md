# k8s-experiments

## side-updater


```bash
# With ReadWriteOnce
kubectl apply -k side-updater/manifest/base
kubectl -n side-updater get pods -w
# the 3 pods runs on the same node
kubectl -n side-updater get pods,svc,pvc,pv -o wide

kubectl -n side-updater port-forward service/side-updater 8888:80
```



kubectl -n test port-forward svc/nginx-date 8888:80

kubectl -n test exec -ti $(kubectl -n test get pods -o name) /bin/sh

