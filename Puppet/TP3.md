# TP3 - Variables et facts : reprise manifest ntp multi distri

- Reprendre le manifest de conformité ntp : manage_ntp.pp
  - 1 - Déclarer une variable ntp_pkg_version qui s'adapte en fonction de l'os name
  - 2 - Déclarer une variable ntp_service_name qui s'adapte en fonction de l'os family
  - 3 - Utiliser ces variables dans les resources déclarée du manifest