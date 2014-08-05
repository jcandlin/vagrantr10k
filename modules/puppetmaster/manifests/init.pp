class puppetmaster {
  exec { 'addrpm':
    command => '/bin/rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-6.noarch.rpm',
    returns => [0,1],
  } ->
  package { 'puppet-server':
    ensure => present,
  } ->
  file { '/etc/puppet/puppet.conf':
    ensure => present,
    content => template('puppetmaster/puppet.conf.erb'),
  } ->
  file { '/etc/puppet/autosign.conf':
    ensure => present,
    source => 'puppet:///modules/puppetmaster/autosign.conf',

    } ->
  host { 'hostsetup':
    name => $fqdn,
    ip => '127.0.0.1',
  } ->
  service { 'puppetmaster':
    ensure => running,
    enable => true,
  }
}
