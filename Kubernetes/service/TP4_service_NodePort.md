## Exercice

Dans cet exercice, vous allez créer un Deplpoyment et l'exposer à l'extérieur du cluster en utilisant un Service de type *NodePort*.

### 1. Création d'un Deployment

Créez un fichier *frontend_php_deploy.yaml* définissant un Deployment ayant les propriétés suivantes:
- nom: *frontend-deploy*
- label associé au Pod: *app: frontend*
- replicas : 3
- nom du container: *frontend*
- label : *app: frontend*
- image du container: *bilbloke/frontend:1.0*

### 2. Lancement du Deployment

La commande suivante permet de créer le Deployment

```
$ kubectl apply -f frontend_php_deploy.yaml
```

### 3. Définition d'un service de type NodePort

Créez un fichier *frontend_service_NodePort.yaml* définissant un service ayant les caractéristiques suivantes:
- nom: *frontend*
- type: *NodePort*
- un selector permettant le groupement des Pods ayant le label *app: frontend*.
- exposition du port *80* à l'intérieur du cluster
- forward des requètes vers le port *80* des Pods sous-jacents
- exposition du port 31001 sur chacun des nodes du cluster (accès depuis l'extérieur)

### 4. Lancement du Service

A l'aide de *kubectl* créez le Service défini dans *frontend_service_NodePort.yaml*

### 5. Accès au Service depuis l'extérieur

Lancez un navigateur sur le port 31001 de l'une des machines du cluster.

Note: vous pouvez obtenir les adresses IP des nodes de votre cluster dans la colonne *EXTERNAL-IP* du résultat de la commande suivante:
```
$ kubectl get nodes -o wide
```


### 6. Cleanup

Supprimez l'ensemble des ressources créés dans cet exercice
    - ```kubectl delete svc [nameofservice]````
    - ```kubectl delete -f frontend_php_deploy.yml ```