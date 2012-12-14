class root
{
  include "mc"

  user
  {
    "root":
      shell    => "/bin/zsh",
      password => '$1$JeeGY0hW$sqdXdsgEJ6fWX7U6Xly7n1',
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
