class mc
{
  include "apt"

  package
  {
    "mc":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
