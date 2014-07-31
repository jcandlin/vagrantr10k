# == Class: r10k
#
# Installs the r10k gem and sets up /etc/r10k.yaml from template.
#
# === Parameters
#
# Document parameters here.
#
# $r10k_giturl = URL to r10k-site git repo
#
# === Authors
#
# Author Name alastair@montgomery.me.uk
#
# === Copyright
#
# Copyright 2014 Alastair Montgomery
#
class r10k (
    $r10k_giturl = 'https://github.com/user/r10k-site'
    $r10k_cache  = '/var/cache/r10k'
    $r10k_basedir = '/etc/puppet/environments'
  ) {
  package { 'ruby':
    ensure => present,
  } ->
  package { 'r10k':
        ensure => 'installed',
        provider => 'gem',
  }
  file { '/etc/r10k.yaml':
    ensure => present,
    contents => template('r10k/r10k.yaml.erb'),
  }
}

