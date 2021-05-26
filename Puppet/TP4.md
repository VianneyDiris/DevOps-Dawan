# TP4 - Module et classes

- Création d'un module apache :
  
  - 1 - Créer la structure du module apache :

      ```mkdir -p modules/apache/{templates,manifests,files}```

  - 2 - Créer 4 manifests :
    - init.pp => main classe qui appellera la classe fille install.pp
    - install.pp => classe pour installer package apache et gestion service apache
    - config.pp => classe pour déployer le template index.html
    - params.pp => classe de déclaration des variables
      - $package_name (RedHat : httpd, Debian : apache2)
      - $service_name : (RedHat : httpd, Debian : apache2)
      - $path_file : (RedHat : /usr/share/httpd, Debian : /var/www/html)

  - 3 - Créer un fichier de type template index.html.epp dans le répertoire template
    - Y écrire une structure html avec utilisation de facts par exemple
  
        ```
        <html>
          <body style="color: <%= @color ? @color : 'black' %> ">>
            <p> Page web Puppet </p>
            <p> Version Linux : {facts} </p>
          </body>
        </html>
        ```

  - 4 - appeler le module depuis le manifest principal : site.pp 