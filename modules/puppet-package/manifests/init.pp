class puppet-package
{
  package
  {
    'puppet':
      ensure  => latest,
      require => Exec["apt-get-update"],
  }

  package
  {
    'puppetmaster':
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
