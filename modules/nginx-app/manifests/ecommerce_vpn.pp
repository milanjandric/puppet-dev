class nginx-app::ecommerce_vpn
{
  file
  {
    "/etc/nginx/sites-available/ecommerce.vpn.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/ecommerce.vpn.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/ecommerce.vpn.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/ecommerce.vpn.shippingeasy.com",
      require => File["/etc/nginx/sites-available/ecommerce.vpn.shippingeasy.com"],
      notify  => Service["nginx"],
  }
}
