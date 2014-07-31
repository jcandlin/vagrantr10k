# R10K Test Setup

class puppetmaster {
  exec { 'addrpm':
    command => '/bin/rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-6.noarch.rpm',
    returns => [0,1],
  } ->
  package { 'puppet-server':
    ensure => present,
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
