class nginx-app::localhost
{
  file
  {
    "/var/www/localhost":
      ensure => directory,
      mode   => 755,
      owner  => www-data,
      group  => www-data,
  }

  file
  {
    "/var/www/localhost/cc.php":
      ensure  => present,
      source  => "puppet:///modules/nginx-app/var/www/localhost/cc.php",
      owner   => www-data,
      group   => www-data,
      mode    => 644,
      require => File["/var/www/localhost"],
  }

  file
  {
    "/etc/nginx/sites-available/localhost":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/localhost",
      require =>
      [
        Package["nginx"],
        File["/var/www/localhost/cc.php"],
      ],
  }

  file
  {
    "/etc/nginx/sites-enabled/localhost.com":
      ensure  => link,
      target  => "../sites-available/localhost",
      require => File["/etc/nginx/sites-available/localhost"],
      notify  => Service["nginx"],
  }
}
