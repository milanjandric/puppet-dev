class git
{
  include "apt"

  package
  {
    "git-core":
      ensure => latest,
      require => Exec["apt-get-update"],
      notify => Exec["git-config"],
  }

  exec
  {
    "git-config":
      path => ["/usr/bin"],
      command => "git config --global color.ui auto",
      refreshonly => true,
  }
}
