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
    mode => '644',
  } ->
  host { 'hostsetup':
    name => $fqdn,
    ip => '127.0.0.1',
  } ->
  service { 'puppetmaster':
    ensure => running,
    enable => true,
  }

  file { '/usr/local/src/r10k-site.git':
      ensure => directory,
  } ->
  exec { 'createbear':
    command => '/usr/bin/git --bare init',
    cwd => '/usr/local/src/r10k-site.git',
    require => Class['utils'],
  } ->
  file { '/usr/local/src/r10k-site.git/hooks/post-receive':
    content => 'sudo r10k deploy environment -p -v',
    mode => 755,
  }
}
