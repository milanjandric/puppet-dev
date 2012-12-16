class dev-base
{
  include "apt"
  include "bzip2"
  include "mc"
  include "puppet-package"
  include "root"
  include "ssh"
  include "tmux"
  include "zsh"
  include "wkhtmltopdf"
  include "rubygems"
  include "compass"
  include "shippingeasy-repo"
  include "apache2"
  include "php"

  php::pear { ["cgi", "cli", "curl", "gd", "geoip", "mcrypt", "pgsql", "xsl"]: }
}

