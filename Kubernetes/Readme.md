## Docs
https://kubernetes.io/fr/

## Installation environnement maquette

1 - KUBECTL => client K8s
https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/

   - a. Téléchargement du binaire
   - b. Configuration PATH
   - c. En ligne de commande :
   ```
   kubectl version
   Client Version: version.Info{Major:"1", Minor:"20", GitVersion:"v1.20.2"
   ```

2 - MINIKUBE => outils de déploiement d'un "Cluster K8S" via une VM
https://kubernetes.io/fr/docs/setup/learning-environment/minikube/
   - a. Linux / Windows : téléchargement et install du package
   - b. Test accès à la commande :
    ```
    minikube --help 
    ```
   - c. Lancement du déploiement :
       VirtualBox : ``` minikube start --driver=virtualbox ```

3 - Vérification cluster K8S : (sur la machine où est installé le binaire kubectl)

   $ kubectl get nodes
   NAME       STATUS   ROLES                  AGE   VERSION
   minikube   Ready    control-plane,master   31m   v1.20.2

-----------------------------------------------------------------------------------------------------
### Projet K8S => Répertoire de travail où seront stockés les fichier yaml (code)

=> Créer un répertoire de travail qui sera accessible et lu par le binaire kubectl
=> Ouvrir un terminal (bash, cmd, powershell) et se positionner dans ce nouveau répertoire de travail
=> Idéalement versionner ce répertoire comme nouveau GIT


-------------------------------------
### Présentation ressource POD
```
kubectl run nginx --image nginx
kubectl get pods
```
- Visualisation/inspection (docker inspect) :
  ```kubectl describe pods nginx```
- Visualisation de pod dans un namespace particulier :
  ```kubectl get pod --namespace kube-system```

- Création d'un fichier de specification d'un POD en YAML:
   a. Listing des api-resources du cluster
      ```kubectl api-resources```
   b. Création du fichier Yaml
   c. Application (création de la ressource dans le cluster)
      ```kubectl apply -f premier_pod.yml```
- Transposition DOCKER -> K8S
  - Docker : ``` docker container exec -it .....```
  - K8S    : ``` kubectl exec -it {pod} -- {CMD}```

- Port-forwarding TEMPORAIRE pour tester l'accès à l'appli interne du POD
  ```kubectl port-forward monpod 8080:80```


----------------------------------
## Présentation resource Deployment (replicaset)
- Création d'une ressource type deploy :
  ```kubectl apply -f whoami-deployment.yml```
- Visualisation :
  ``` 
  kubectl get deploy
  kubectl get rs
  kubectl get po
  kubectl get all
  kubectl get all -l app=whoami
  ```

----------------------------------------
## Présentation ressource service
- ClusterIP => exposition pod à l'intérieur du cluster (communication entre pods)
- NodePort  => exposition pod à l'extérieur du cluster (accès utilisateur)
- Création via spécification yaml :
   ```  
   kubectl apply -f service.yaml 
   ``` 
- Création via approche impérative :
   ``` 
   kubectl expose pod .... 
   ``` 
- Visualisation :
 ``` 
   kubectl get service
   kubectl describe service {nom_service}
 ``` 

## Dashboard

- Si minikube :
 ``` 
   minikube dashboard
```
- Si prod : on se réfère à la doc

---------------------------------------------
METRICS 

- Déploiement des ressources :
```
   kubectl apply -f metrics.yaml
   kubectl top nodes
```
NAME           CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
minikube       181m         9%     1425Mi          71%       
minikube-m02   45m          2%     987Mi           49%       
minikube-m03   46m          2%     922Mi           46%    

- Visualisation dans le dashboard :
$ minikube dashboard

-------------------------------
AUTOSCALE : HPA

- demo sur deployment frontend-deploy
  a. Ajout de la specification d'une ressource de type HorizontalPodAutoscaler dans le fichier de spec frontend_php_deploy.yml
  b. Application de la modif:
  ```
     kubectl apply -f frontend_php_deploy.yml
   ```
  c. Création de Pods qui vont stresser l'appli frontend sur l'URL du service NodePort
   ```
   kubectl run ab --restart='Never' --image=jordi/ab -- -n 1000000 -c 50 http://192.168.99.142:31001/index.php
   ```
  d. En visualisant les ressources du label app=frontend on voit le hpa et son status :
     ```
     kubectl get all -l app=frontend
     ```
     horizontalpodautoscaler.autoscaling/frontend-hpa   Deployment/frontend-deploy   13%/10%   5         20        20         7m7s