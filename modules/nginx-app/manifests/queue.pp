class nginx-app::queue
{
  file
  {
    "/etc/nginx/sites-available/queue.shippingeasy.com":
      owner   => root,
      group   => root,
      purge   => true,
      force   => true,
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/nginx-app/etc/nginx/sites-available/queue.shippingeasy.com",
      require => Package["nginx"],
  }

  file
  {
    "/etc/nginx/sites-enabled/queue.shippingeasy.com":
      ensure  => link,
      target  => "../sites-available/queue.shippingeasy.com",
      require => File["/etc/nginx/sites-available/queue.shippingeasy.com"],
      notify  => Service["nginx"],
  }
}
