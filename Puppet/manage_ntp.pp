
# Resource service => gestion services
service { 'ntp':
  ensure => running,
  enable => true,
}

# Resource package => installation packages
package { 'ntp':
  ensure => present,
  before => Service['ntp'],
}

# Resource augeas => gestion contenu fichier
#augeas { 'conf ntp':
#  context => '/files/etc/ntp.conf',
#  changes => [ 'set logfile /var/log/ntpd.log',
#  ],
#  notify  => Service['ntp'],
#  require => Package['ntp'],
#}

# Resource file_line => gestion de contenu de fichier
file_line { 'conf ntp':
  ensure  => present,
  path    => '/etc/ntp.conf',
  line    => 'logfile /var/log/ntpd3.log',
  match   => '^logfile',
  notify  => Service['ntp'],
  require => Package['ntp'],
}
