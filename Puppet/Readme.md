Formation Puppet init

Liens web :

https://puppet.com/docs/



# Installation Puppet server + agents

https://puppet.com/docs/puppet/7.5/install_puppet.html


$ uname -a
Linux ppmaster 5.4.0-66-generic #74-Ubuntu SMP Wed Jan 27 22:54:38 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

$ cat /etc/os-release 
NAME="Ubuntu"
VERSION="20.04.2 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.2 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

Command for puppet-master
```shell
cd /tmp/
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb

apt update
apt install puppetserver puppet-agent
```
Une fois les packages installés, il faut recharger le PATH => déconnexion/reconnexion.

# Accès aux commandes puppet (agent) et puppetserver (serveur)


## Langage Puppet
https://puppet.com/docs/puppet/7.5/intro_puppet_language_and_code.html

Manifests :

Recherche d'une resource :
https://puppet.com/docs/puppet/7.5/types/notify.html

Application d'un manifest en mode Puppet agent stand-alone"
```
puppet apply premier_manifest.pp 
```

## Tips, bonnes pratiques
 - utilisation d'un linter : puppet-lint
```shell
apt install puppet-lint
puppet-lint premier_manifest.pp
```
 - Utilisation git hooks : Ex livre Ansible Ch2, 6.3 Mécanisme de hook
   => Exécuter un script, un lint avant le commit GIT

 - Aide en ligne de commande :
   - Liste des ressources disponibles
```shell
puppet describe --list
```
   - Doc sur une ressource :
```shell
puppet describe package
```

   - Conversion objet Linux en resource puppet :
```shell
puppet resource user vagrant
```


# TP : 
Doc resource user : https://puppet.com/docs/puppet/7.5/types/user.html


## Ordonnancement et relations entre resources :
https://puppet.com/docs/puppet/7.5/lang_relationships.html

## Installation de librairies de resources supplémentaires :
https://forge.puppet.com/modules/puppetlabs/stdlib/7.0.0
```shell
puppet module install puppetlabs-stdlib --version 7.0.0
```

-----------
J2
-----------

# Configuration PuppetServer + Agents

1°) puppserver

   a. Arbo config : /etc/puppetlabs => configuration puppetsever (arborescence, protocoles)
                    /etc/default/puppetserver => configuration instance (processus, jvm)

   b. Prérequis : DNS et NTP
       => mode local : /etc/hosts
         ip_address puppet
   
   c. Service puppetserver
   ```
   systemctl status puppetserver.service
   systemctl start puppetserver.service
   ```

     Ex pb démarrage : java.lang.Error: Not enough available RAM
     => Modification de la config de la JVM

   d. Arbo logs : /var/log/puppetlabs/puppetserver
                  /var/log/puppetlabs/puppetserver/puppetserver.log

2°) Puppet Agent
https://puppet.com/docs/puppet/7.5/install_agents.html

   a. Arbo config : /etc/puppetlabs/puppet
      => Nom du puppetserver par défaut : puppet (DNS)

   b. Test connexion SSL
      ```
      puppet ssl bootstrap
      ```

   c. Test agent -> puppetserver
      ```
      puppet agent -t
      ```

   2.1°) Puppet agent sur Debian Buster :
      a. Téléchargement du package de configuration repo puppet pour Debian Buster :
      ```
      wget https://apt.puppet.com/puppet7-release-buster.deb
      ```

      b. Installation du .deb
      ```
      dpkg -i puppet7-release-buster.deb
      ```

      c. Installation puppet-agent
      ```
      apt update
      apt install puppet-agent
      ```

      d. Prérequis DNS
      # Mode local : fichier /etc/hosts

      e. Test connexion SSL
      ```
      puppet ssl bootstrap
      ```

   2.2°) Puppet agent sur CentOS 8 :
      a. Téléchargement du package de configuration repo puppet pour Debian Buster :
      ```
      wget https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
      ```

      b. Installation du .deb
      ```
      rpm -Uvh puppet7-release-el-8.noarch.rpm
      ```

      c. Installation puppet-agent
      ```
      yum install puppet-agent
      ```

      d. Prérequis DNS
      # Mode local : fichier /etc/hosts

      e. Test connexion SSL
      ```
      puppet ssl bootstrap
      ```

3°) Signature des SSL request sur puppetmaster

  a. Listing des "Requested Certificates" :
      ```
      puppetserver ca list
      ```

  b. Signature des "Requested Certificates" :
      ```
      puppetserver ca sign --certname cli01.formation.lan
      ```

  c. Listing des certificats signés :
      ```
      puppetserver ca list
      ```
 e. Autosign : https://puppet.com/docs/puppet/7.5/ssl_autosign.html


4°) Gestion de l'environnement code puppet

=> De facon à pouvoir éditer correctement du code puppet dans notre répertoire partagé /vagrant et que ce soit visible dans l'arborescence puppet 
   /etc/puppetlabs/code/environments/production
   ```
   mv /etc/puppetlabs/code/environments/production /vagrant/
   ln -s /vagrant/production/ /etc/puppetlabs/code/environments/production
   ```

----------
J3
-----------
- Structure organisée de classes, files, templates
- Entité autonome (réutilisable, paratageable) pour installer une birque technologique
- Appelé depuis une manifest (comme une classe)
- Puppet forge : repo publique de modules installables (officiels, communautaires)

Pour exemple, voir [module apache](production/modules/apache/manifests/init.pp)

- https://puppet.com/docs/puppet/7.5/modules_fundamentals.html
- https://forge.puppet.com/