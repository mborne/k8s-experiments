# empty-dir

Test du comportement des volumes emptyDir.

## Principe

* [empty-dir/manifests/deployment.yml](empty-dir/manifests/deployment.yml) : conteneur nginx avec deux volumes emptyDir (un pour les logs et un pour le contenu HTML initialisé avec le nom du pod)
* [empty-dir/manifests/service.yml](empty-dir/manifests/service.yml) : service

## Test

```bash
# Pour empty-dir.dev.localhost :
bash k8s-test.sh
# Pour domaine personnalisé :
# DEVBOX_HOSTNAME=devbox.ign.fr bash k8s-test.sh
```

