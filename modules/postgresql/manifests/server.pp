class postgresql::server(
  $version          = '9.1',
  $listen_addresses = 'localhost',
  $max_connections  = 100,
  $shared_buffers   = '24MB',
  $psql_port        = '5432'
  ) {

  require postgresql::client

  postgresql::server::install{"install-server":
    version           => $version,
    listen_addresses  => $listen_addresses,
    max_connections   => $max_connections,
    shared_buffers    => $shared_buffers,
    psql_port         => $psql_port
  }
}


