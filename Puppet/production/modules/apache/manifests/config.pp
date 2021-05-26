# Class: config
#
#
class apache::config inherits apache::params{
  # resources
  file { 'Copie template index.html':
    path    => "${http_path}/index.html",
    content => epp('apache/index.html.epp'),
  }
}
