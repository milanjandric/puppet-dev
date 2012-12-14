class root
{
  include "mc"

  user
  {
    "root":
      shell    => "/bin/zsh",
      password => '$6$U4B3hdzh$Zc/qv5B.U59DiPrOiMIDp56Cr/ggm7CxcLTAkY/hY76crY7xQ623JtaIvN5zqWf',
  }

  file
  {
    "/root/.zshrc":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/skel/.zshrc",
      require => Package["zsh"];
  }
}
