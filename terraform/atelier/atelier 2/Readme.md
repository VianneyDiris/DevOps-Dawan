Cet atelier va permettre de créer une instance virtuelle
Les ressources liées:

    \- scaleway_instance_ip
    \- scaleway_instance_security_group
    \- scaleway_instance_server
    \- scaleway_instance_volume


* Créer une instance virtuelle, de type "DEV1-S", en utilisant une image "ubuntu_focal", et avec pour nom "prenom-01"
* Ajouter un disque supplémentaire de 20Go
* Activer une adresse publique réservée
* Utiliser un groupe de sécurité pour restreindre les access.
* Rendre configurable le type d'instance et la taille du disque additionel
* Afficher l'adresse IP à l'écran
* Créer deux modules : 1 pour la gestion du security_group et un pour le serveur (IP, disque et instance)
* Rendre le nombre de serveur configurable
* Faire en sorte que si le workspace est "default", le nombre d'instance soit égal à 1, sinon la valeur fournie par l'utilisateur
* Déplacer le state dans un bucket (demander la création par le formateur)

---
## Bonus

Cet atelier va permettre de créer une instance virtuelle
Les ressources liées:

    \- scaleway_k8s_cluster
    \- scaleway_k8s_pool
    \- helm_release

* Créer un cluster Kubernetes, comprenant 2 nodes de type DEV1-M
* Utiliser le provider Helm pour déployer une application de votre choix sur le cluster kubernetes