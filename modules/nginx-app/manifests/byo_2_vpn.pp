class nginx-app::byo_2_vpn
{
  file
  {
    "/etc/nginx/sites-available/byo_2.vpn.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/byo_2.vpn.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/byo_2.vpn.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/byo_2.vpn.shippingeasy.com",
      require => File["/etc/nginx/sites-available/byo_2.vpn.shippingeasy.com"],
      notify  => Service["nginx"],
  }
}
