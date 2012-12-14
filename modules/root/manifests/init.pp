class root
{
  include "mc"

  user
  {
    "root":
      shell    => "/bin/zsh",
      password => '$6$GsF63lxN$mM/DSS9thaqQ4wX8eqyYkhKkjsXuSdWPe61RLPz/FkruIFVN3memNk4rVDYDLj/',
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
