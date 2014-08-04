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
  package { 'nc':
    ensure => present,
  }
  service { 'iptables':
    ensure => stopped,
  }
  exec { 'adderlangrpm':
    command => '/bin/rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm',
    returns => [0,1],
  }
}

