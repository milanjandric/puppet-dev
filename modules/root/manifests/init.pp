class root
{
  include "mc"

  user
  {
    "root":
      shell    => "/bin/zsh",
      password => '$6$GtAq.Q3m$EBsGylUlXRFKOUrd4RvqanwqeCBAv6cw78aVEAu8LrAc7g5NpmCaUSdxv63I92sg3ADhzyNSsdZJ4i7wIs4Qp0',
  }

  file
  {
    "/root/.zshrc":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/skel/.zshrc",
      require => Package["zsh"],
  }

  file
  {
    "/root/.ssh":
      ensure => directory,
      mode   => 700,
      owner  => root,
      group  => root,
  }

  file
  {
    "/root/.ssh/authorized_keys":
      ensure => present,
      mode   => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/root/root/.ssh/authorized_keys",
  }

  file
  {
    "/root/.ssh/id_dsa":
      ensure => present,
      mode   => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/root/root/.ssh/id_dsa",
  }

  file
  {
    "/root/.ssh/id_dsa.pub":
      ensure => present,
      mode   => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/root/root/.ssh/id_dsa.pub",
  }

  file
  {
    "/root/.ssh/config":
      ensure => present,
      mode   => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/root/root/.ssh/config",
  }
}
