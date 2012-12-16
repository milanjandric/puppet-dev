class postgresql
{
  include "apt"

  package
  {
    "postgresql":
      ensure  => present,
      require => Exec["apt-get-update"],
  }

  user
  {
    "postgres":
      ensure  => present,
      shell   => "/bin/zsh",
      require => Package["postgresql"],
  }

  file
  {
    "/var/lib/postgresql/.zshrc":
      ensure  => present,
      owner   => postgres,
      group   => postgres,
      mode    => 644,
      source  => "puppet:///modules/zsh/etc/skel/.zshrc",
      require => User["postgres"],
  }

  service
  {
    "postgresql":
      ensure    => running,
      hasstatus => true,
      enable    => true,
      subscribe =>
      [
        File["/etc/postgresql/9.1/main/postgresql.conf"],
        File["/etc/postgresql/9.1/main/pg_hba.conf"],
      ],
  }

#  exec
#  {
#    "update-template1":
#      path        => ["/usr/bin"],
#      command     => "psql -f /var/lib/postgresql/pgpool-recovery.sql template1",
#      group       => postgres,
#      user        => postgres,
#      refreshonly => true,
#      require     =>
#      [
#        File["/var/lib/postgresql/pgpool-recovery.sql"],
#        Service["postgresql"],
#      ],
#  }
}
