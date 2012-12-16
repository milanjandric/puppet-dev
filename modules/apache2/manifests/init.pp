class apache2
{
    package
    {
        "apache2":
            ensure => latest,
            require => Exec["apt-get-update"],
    }

    file
    {
        "/etc/apache2/mods-enabled/rewrite.load":
            ensure => link,
            target => "../mods-available/rewrite.load",
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/mods-enabled/ssl.load":
            ensure => link,
            target => "../mods-available/ssl.load",
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/mods-enabled/ssl.conf":
            ensure => link,
            target => "../mods-available/ssl.conf",
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/sites-available/www.shippingeasy.dev":
            ensure => present,
            mode => 644,
            owner  => root,
            group  => root,
            source => "puppet:///modules/apache2/etc/apache2/sites-available/www.shippingeasy.dev",
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/sites-enabled/www.shippingeasy.dev":
            ensure => link,
            target => "../sites-available/www.shippingeasy.dev",
            require => File["/etc/apache2/sites-available/www.shippingeasy.dev"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/sites-available/ssl.www.shippingeasy.dev":
            ensure => present,
            mode => 644,
            owner  => root,
            group  => root,
            source => "puppet:///modules/apache2/etc/apache2/sites-available/ssl.www.shippingeasy.dev",
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/sites-enabled/ssl.www.shippingeasy.dev":
            ensure => link,
            target => "../sites-available/ssl.www.shippingeasy.dev",
            require => File["/etc/apache2/sites-available/ssl.www.shippingeasy.dev"],
            notify => Service["apache2"],
    }

    file
    {
        "/etc/apache2/sites-enabled/000-default":
            ensure => absent,
            require => Package["apache2"],
            notify => Service["apache2"],
    }

    host {
        'www.shippingeasy.dev':
            ensure => 'present',
            target => '/etc/hosts',
            ip => '127.0.0.1',
    }

    service
    {
        "apache2":
            ensure => running,
            enable => true,
            require => Package["apache2"],
    }
}
