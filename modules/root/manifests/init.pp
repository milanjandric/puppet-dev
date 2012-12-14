class root
{
  include "mc"

  user
  {
    "root":
      shell    => "/bin/zsh",
      password => '$6$3LFHcTBT$ZFENIEd1ZdIVP64Ns5Ygnd..d2qWWA6EJ6dtiB/bAQfWtoDsZKFdRDuGMtP4//u',
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
