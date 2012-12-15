class nginx-app::staging
{
  file
  {
    "/etc/nginx/sites-available/staging.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/staging.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/staging.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/staging.shippingeasy.com",
      require => File["/etc/nginx/sites-available/staging.shippingeasy.com"],
      notify  => Service["nginx"],
  }

  file
  {
    "/etc/nginx/sites-available/staging.vpn.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/staging.vpn.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/staging.vpn.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/staging.vpn.shippingeasy.com",
      require => File["/etc/nginx/sites-available/staging.vpn.shippingeasy.com"],
      notify  => Service["nginx"],
  }

  file
  {
    "/etc/nginx/ssl":
      ensure  => directory,
      mode    => 755,
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/ssl/wildcard.vpn.shippingeasy.com.crt":
      ensure  => present,
      source  => "puppet:///modules/nginx-app/etc/nginx/ssl/wildcard.vpn.shippingeasy.com.crt",
      mode    => 644,
      require => File["/etc/nginx/ssl"],
      notify  => Service["nginx"],
  }

  file
  {
    "/etc/nginx/ssl/wildcard.vpn.shippingeasy.com.key":
      ensure  => present,
      source  => "puppet:///modules/nginx-app/etc/nginx/ssl/wildcard.vpn.shippingeasy.com.key",
      mode    => 644,
      require => File["/etc/nginx/ssl"],
      notify  => Service["nginx"],
  }
}
