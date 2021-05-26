user { 'Manage user':
  name       => 'test',
  shell      => '/bin/bash',
  comment    => 'user de test manage par puppet',
  managehome => true,
  groups     => ['formation'],
  require    => Group['Manage group']
}

group { 'Manage group':
  ensure => present,
  name   => 'formation',
}
