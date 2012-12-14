class apt
{
  exec
  {
    "apt-get-update":
      command     => "apt-get update",
      refreshonly => true,
      path        => ["/usr/bin"],
  }
}
