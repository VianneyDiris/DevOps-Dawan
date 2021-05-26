# Class: install
#
#
class apache::install inherits apache::params{
  # resources
  # Resource service => gestion services
  service { "${http_name}":
    ensure => running,
    enable => true,
  }

  # Resource package => installation packages
  package { "${http_name}":
    ensure => present,
    before => Service["${http_name}"],
  }
}

