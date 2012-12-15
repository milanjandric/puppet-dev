class wkhtmltopdf
{
  file
  {
    "/usr/bin/wkhtmltopdf":
      ensure => present,
      owner  => root,
      group  => root,
      mode   => 755,
      source => "puppet:///modules/wkhtmltopdf/usr/bin/wkhtmltopdf",
  }

  file
  {
    "/usr/bin/wkhtmltopdf-amd64":
      ensure => link,
      owner  => root,
      group  => root,
      target => "wkhtmltopdf",
  }
}
