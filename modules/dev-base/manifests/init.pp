class dev-base
{
  include "apt"
  include "bzip2"
  include "mc"
  include "puppet-package"
  include "root"
  include "ssh"
  include "git"
  include "tmux"
  include "zsh"
  include "wkhtmltopdf"
  include "rubygems"
  include "compass"
  include "shippingeasy-repo"
  include "postgresql"
  include "apache2"
  include "php"
  include "postgresql"

  postgresql::user{'dev':
    ensure   => present,
    password => 'dev',
  }

  postgresql::database{'shippingeasy':
    ensure   => present,
    owner    => 'dev',
  }

  php::pear { ["cgi", "cli", "curl", "gd", "geoip", "mcrypt", "pgsql", "xsl"]: }
}

