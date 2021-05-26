# TP1 - Resources

- Récupérer le détail de la ressource user ‘root’

 ```shell
 puppet resource user root
 ```

- Récupérer le détail de la ressource concernant le service 'sshd'

```shell
puppet resource service sshd
```

- Écrire la description d’une ressource user dans un manifest : manage_user.pp :
  - Prénom : test
  - Shell : /bin/bash
  - comment (commentaire) : "user de test manage par puppet"
  - managehome: true
  
  - [Lien vers le manage_user.pp](manage_user.pp)
