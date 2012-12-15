class openjdk {

  package {
    "openjdk-6-jre":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
