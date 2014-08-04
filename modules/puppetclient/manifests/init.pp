class puppetclient {
  exec { 'addrpm':
    command => '/bin/rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-6.noarch.rpm',
    returns => [0,1],
  } ->
  package { 'puppet':
    ensure => present,
  } ->
  file { '/etc/puppet/puppet.conf':
    ensure => present,
    content => template('puppetclient/puppet.conf.erb'),
  } ->
  host { 'hostsetup':
    name => "$fqdn",
    ip => '127.0.0.1',
  } ->
  host { 'pmhostsetup':
    name => "puppetmaster.prod.williamhill.plc",
    ip => '192.168.50.3',
  }
}
