class www-data
{
  user
  {
    "www-data":
      shell => "/bin/zsh",
      require => Package["nginx"],
  }

  file
  {
    "/var/www":
      ensure => directory,
      owner => "www-data",
      group => "www-data",
      mode => "755",
      require => User["www-data"],
  }

  file
  {
    "/var/www/.zshrc":
      ensure  => present,
      mode    => 644,
      owner   => www-data,
      group   => www-data,
      source  => "puppet:///modules/zsh/etc/skel/.zshrc",
      require => Package["zsh"];
  }

  file
  {
    "/var/www/.ssh":
      ensure => directory,
      mode   => 700,
      owner  => www-data,
      group  => www-data,
  }
}
