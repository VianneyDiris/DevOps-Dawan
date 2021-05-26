# Class: params
#
#
class apache::params {
  # resources
  # Config :
  case $facts['os']['family'] {
    'Debian': {
      $http_name = 'apache2'
      $http_path = '/var/www/html'

    }
    'RedHat': {
      $http_name = 'httpd'
      $http_path = '/usr/share/httpd'
    }
    default: {
    fail("Module ${$http_name} is not supported on ${::operatingsystem}")
    }
  }
}
