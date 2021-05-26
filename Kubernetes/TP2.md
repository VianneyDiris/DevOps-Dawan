# Création d'un Pod multi conteneurs

## Exercice

Dans cet exercice, vous allez créer une spécification pour lancer un  Pod avec deux conteneurs.

### 1. Création de la spécification

Créez un fichier yaml *multicontainer.yml* définissant un Pod ayant les propriétés suivantes:
- nom du Pod: *multicontainer*
- image du container nginx: *nginx:1.18-alpine*
- nom du container: *nginx*
  
- image du container debian : *debian:buster-slim*
- nom du container: *debian*
- command: ["sleep", "600"]

solution : [fichier multicontainer.yml](pods/multicontainer.yml)

### 2. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*
```kubectl apply -f .\multicontainer.yml ```

### 3. Vérification

Listez les Pods lancés et assurez vous que le Pod *multicontainer* apparait bien dans cette liste.
```kubectl get pods```

### 4. Details du Pod

Observez les détails du Pod à l'aide de *kubectl* et retrouvez l'information de l'image utilisée par le container *multicontainer*.
```kubectl describe pod multicontainer```

### 5. Se connecter dans le conteneur debian du pod multicontainer

Avec la commande *kubectl exec -it * se connecter dans le conteneur debian
Installer le package curl
```kubectl exec -it multicontainer -c debian bash```
```apt update && apt install curl```

Tester une requete curl vers le service pod_nginx ```curl http://localhost:80```

### 6. Suppression du Pod

Supprimez le Pod.
```kubectl delete pod multicontainer```