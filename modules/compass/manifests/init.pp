class compass
{
  exec
  {
    "install-compass":
      command => "gem install compass",
      creates => "/usr/local/bin/compass",
      path    => ["/usr/bin"],
      require => Package["rubygems"],
  }

  exec
  {
    "install-compass-rgbapng":
      command => "gem install compass-rgbapng",
      creates => "/var/lib/gems/1.8/gems/compass-rgbapng-0.1.1/lib/rgbapng.rb",
      path    => ["/usr/bin"],
      require => Exec["install-compass"],
  }
}
