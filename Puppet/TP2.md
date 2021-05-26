# TP2 - Ordonnancement + notify

## Install et config ntp

- Créer un manifest : manage_ntp.pp
- Utiliser les resources "service, package et augeas pour s'assurer que le package ntp soit installé, son service démarré et ajouter une ligne "logfile /var/log/ntpd.log" dans /etc/ntp.conf (en fin de fichier).
- Gérer l'ordonancement
  - require/before
- Redémarrer le service ntp si modif dans le fichier /etc/ntp.conf
  - notify/subscribe

Attention si vous ne voulez pas utilisez Augeas mais file_line
```Shell
sudo /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib
```

  - [Lien vers le manage_ntp.pp](manage_ntp.pp)