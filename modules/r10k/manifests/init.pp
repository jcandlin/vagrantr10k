class r10k {
  package { 'ruby':
    ensure => present,
  } ->
  package { 'r10k':
        ensure => 'installed',
        provider => 'gem',
        require => Class['puppetmaster'],
  } ->
  file { '/etc/r10k.yaml':
    ensure => link,
    target => '/vagrant/r10k.yaml',
  } ->
  file { '/usr/local/src/r10k-site.git':
      ensure => directory,
      owner => 'vagrant',
      group => 'vagrant',
  } ->
  exec { 'createbear':
    command => '/usr/bin/git --bare init',
    cwd => '/usr/local/src/r10k-site.git',
    user => 'vagrant',
    require => Package['git'],
  } ->
  file { '/usr/local/src/r10k-site.git/hooks/post-receive':
    content => 'sudo r10k deploy environment -p -v',
    mode => 755,
    owner => 'vagrant',
    group => 'vagrant',
  } ->
  exec { 'runr10k':
    command => '/usr/bin/r10k deploy environment -p',
  }
}
