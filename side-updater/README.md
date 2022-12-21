# side-updater

## Principe

* [manifest/base/deployment.yaml](manifest/base/deployment.yaml) définit deux conteneurs sur un même Pod :

* Un conteneur `server` servant le dossier `/usr/share/nginx/html` avec `nginx`
* Un conteneur `updater` générant un fichier `/usr/share/nginx/html/index.html` avec la date du jour

* [manifest/base/pvc.yaml](manifest/base/pvc.yaml) permet de commander le volume ReadWriteOnce correspondant à `/usr/share/nginx/html`





