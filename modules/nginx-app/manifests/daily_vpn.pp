class nginx-app::daily_vpn
{
  file
  {
    "/etc/nginx/sites-available/daily.vpn.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/daily.vpn.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-available/daily.vpn.shippingeasy.com.inc":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/daily.vpn.shippingeasy.com.inc",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/daily.vpn.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/daily.vpn.shippingeasy.com",
      notify  => Service["nginx"],
      require =>
      [
        File["/etc/nginx/sites-available/daily.vpn.shippingeasy.com"],
        File["/etc/nginx/sites-available/daily.vpn.shippingeasy.com.inc"],
      ],
  }
}
