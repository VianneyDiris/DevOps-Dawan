# Exercice

Dans cet exercice, vous allez effectuer un scaling update ainsi qu'un rolling update sur un *deployment*

> Reprendre les deployments et services des TP3 et TP4 (si besoin les recréer)

## 2. Scaling

Changez le nombre de replicas du deployment *frontend* de façon à en avoir 6.
>Note: pour cela vous pourrez avoir besoin de la commande $ kubectl scale .... 

>L'aide en ligne $ kubectl scale --help donne quelques exemples d'utilisation.
``` kubectl scale --replicas=6 deployment/frontend-deploy```

## 3. Mise à jour de l'image

Mettez l'image frontend à jour avec la version bilbloke/frontend:2.0

>Note:pour cela vous pourrez avoir besoin de la commande $ kubectl set image ... > spécifiez l'option --record afin de conserver l'historique de la mise à jour
```kubectl set image deployment/frontend-deploy frontend=bilbloke/frontend:2.0 --record```

## 5. Liste des ressources
Une nouvelle fois, listez les ressources. Que constatez vous ?
    - les pods avec les mises à jours sont crée avant la suppression des ancien pods.

## 6. Historique des mises à jour
Listez les mises à jour (= révisions) du Deployment.

>Note: utilisez la commande kubectl rollout...
```kubectl rollout history deploy/frontend-deploy```

## 7. Effectuez un rollback

Faites un rollback et vérifier que le Deployment est maintenant basé sur la version précédente de l'image (bilbloke/frontend:1.0)

> Pour cela vous pourrez avoir besoin de la commande $ kubectl rollout undo...
```kubectl rollout undo deployment/frontend-deploy```