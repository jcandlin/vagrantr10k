class r10k {
  package { 'ruby':
    ensure => present,
  } ->
  package { 'r10k':
        ensure => 'installed',
        provider => 'gem',
  } ->
  file { '/etc/r10k.yaml':
    ensure => link,
    target => '/vagrant/r10k.yaml',
  } ->
  exec { 'runr10k':
    command => '/usr/bin/r10k deploy environment -p',
  }
}
