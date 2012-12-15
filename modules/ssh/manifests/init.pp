class ssh
{
  package
  {
    'openssh-server':
      ensure  => latest,
      require => Exec["apt-get-update"],
  }

  file
  {
    "/etc/ssh/sshd_config":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/ssh/etc/ssh/sshd_config",
      require => Package["openssh-server"],
      notify  => Service["ssh"],
  }

  file
  {
    "/etc/ssh/ssh_host_dsa_key":
      ensure => present,
      mode => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/etc/ssh/ssh_host_dsa_key",
      require => Package["openssh-server"],
      notify => Service["ssh"],
  }

  file
  {
    "/etc/ssh/ssh_host_dsa_key.pub":
      ensure => present,
      mode => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/etc/ssh/ssh_host_dsa_key.pub",
      require => Package["openssh-server"],
      notify => Service["ssh"],
  }

  file
  {
    "/etc/ssh/ssh_host_rsa_key":
      ensure => present,
      mode => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/etc/ssh/ssh_host_rsa_key",
      require => Package["openssh-server"],
      notify => Service["ssh"],
  }

  file
  {
    "/etc/ssh/ssh_host_rsa_key.pub":
      ensure => present,
      mode => 600,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/etc/ssh/ssh_host_rsa_key.pub",
      require => Package["openssh-server"],
      notify => Service["ssh"],
  }

  service
  {
    "ssh":
      ensure => running,
      subscribe => File["/etc/ssh/sshd_config"],
  }
}
