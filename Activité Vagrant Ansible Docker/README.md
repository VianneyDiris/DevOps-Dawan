Mises en situation
===
## Vagrant - Docker - Ansible

***Objectifs***

Maquettage d'un SI avec les trois VMs suivantes :
* VM pilote Ansible (Debian)
* VM pilote Docker_1 NGINX/PHP (Debian)
* VM pilote Docker_2 SGBD (Centos)

***Consignes***
* **Les trois VMs seront déployées avec Vagrant.**

* **Chaque VM disposera de deux interfaces réseau**
    * Une interface en NAT
    * Une interface en bridge avec les IP statiques suivantes
        * Pilote Ansible : 172.16.0.10/24
        * Pilote Docker_1 : 172.16.0.20/24
        * Pilote Docker_2 : 172.16.0.30/24

* **La VM Docker_1 hébergera les deux conteneurs suivants:**
    * NGINX (*image officielle*)
        * La configuration à utiliser est fournie dans le fichier *conf/nginx.conf*.
        * Le site est constitué du seul fichier html/index.php
        * Ces deux fichiers sont à adapter afin de les *templater* et les transmettre par Ansible avant l'initialisation des conteneurs.
        
    * PHP

        Il faudra partir de l'image ***phpdockerio/php73-fpm*** modifiée afin d'intégrer le pilote ****php-mysql****.
        
* **La VM Docker_2 hébergera un conteneur MariaDB**
    * L'image est l'image officielle
    * Le script d'initialisation *scripts/init.sql* est également à *templater* et à transmettre par Ansible avant l'initialisation du conteneur.


* **Les attendus**

    * Le *Vagrantfile* ayant permis le déploiement des 3 VMs
    * Le *Dockerfile* ayant permis de modifier l'image PHP
    * Le *docker-compose.yml* utilisé sur chaque VM
    * Le *playbook* permettant la *configuration* et l'initialisation des conteneurs sur chacune des VMs.
