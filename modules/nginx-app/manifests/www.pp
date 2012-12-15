class nginx-app::www
{
  file
  {
    "/etc/nginx/sites-available/www.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/www.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/www.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/www.shippingeasy.com",
      require => File["/etc/nginx/sites-available/www.shippingeasy.com"],
      notify  => Service["nginx"],
  }

  file
  {
    "/etc/nginx/sites-available/www.vpn.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/www.vpn.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/www.vpn.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/www.vpn.shippingeasy.com",
      require => File["/etc/nginx/sites-available/www.vpn.shippingeasy.com"],
      notify  => Service["nginx"],
  }
}
