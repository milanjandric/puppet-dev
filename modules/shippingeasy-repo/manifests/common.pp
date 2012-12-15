class shippingeasy-repo::common
{
  $web_path = "/home/milan/repos/shippingeasy"

  file
  {
    "$web_path":
      ensure  => directory,
      owner   => "www-data",
      group   => "www-data",
      mode    => "755",
#      require => Package["apache"],
  }
}
