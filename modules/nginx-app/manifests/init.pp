class nginx-app
{
  package
  {
    "nginx":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }

  file
  {
    "/etc/nginx/nginx.conf":
      ensure  => present,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/nginx-app/etc/nginx/nginx.conf",
      mode    => 644,
      require => Package["nginx"],
  }

  include "localhost"
  include "dev"
  include "www"
  service
  {
    "nginx":
      ensure     => running,
      enable     => true,
      hasrestart => true,
      subscribe  =>
      [
        File["/etc/nginx/nginx.conf"],
        File["/etc/nginx/sites-available/www.shippingeasy.dev"],
        File["/etc/nginx/sites-enabled/www.shippingeasy.dev"]
      ],
  }
}
