class rubygems
{
  package
  {
    "rubygems":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
