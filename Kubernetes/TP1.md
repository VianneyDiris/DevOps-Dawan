# Création d'un Pod

## Exercice

Dans cet exercice, vous allez créer une spécification pour lancer un premier Pod.

### 1. Création de la spécification

Créez un fichier yaml *whoami.yaml* définissant un Pod ayant les propriétés suivantes:
- nom du Pod: *whoami*
- image du container: *containous/whoami*
- nom du container: *whoami*

solution : [fichier whoami](pods/whoami.yml)
### 2. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*
```kubectl apply -f ./whoami.yml```

### 3. Vérification

Listez les Pods lancés et assurez vous que le Pod *whoami* apparait bien dans cette liste.
```kubectl get pods ```

### 4. Details du Pod

Observez les détails du Pod à l'aide de *kubectl* et retrouvez l'information de l'image utilisée par le container *whoami*.
```kubectl describe whoami```

### 5. Accès à l'application via un port-forward

Avec la commande *kubectl port-forward* envoyer une requête à l'application
```kubectl port-forward whoami 9000:80```

### 6. Suppression du Pod

Supprimez le Pod.
```kubectl delete pod whoami```