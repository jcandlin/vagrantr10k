# R10K Test Setup

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
    content => template('/vagrant/puppet.conf.erb'),
  } ->
  host { 'hostsetup':
    name => $fqdn,
    ip => '127.0.0.1',
  }
}

class r10k {
  package { 'ruby':
    ensure => present,
  } ->
  package { 'r10k':
        ensure => 'installed',
        provider => 'gem',
  }
  file { '/etc/r10k.yaml':
    ensure => link,
    target => '/vagrant/r10k.yaml',
  }
}

class utils {
  package { 'tree':
    ensure => present,
  }
  package { 'wget':
    ensure => present,
  }
  package { 'git':
    ensure => present,
  }
  package { 'vim-enhanced':
    ensure => present,
  }
}

include utils
include r10k
include puppetmaster
