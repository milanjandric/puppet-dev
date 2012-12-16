class php
{
    include "apt"

    package
    {
        "php5":
            ensure => latest,
            require => Exec["apt-get-update"],
    }

    file
    {
        "/etc/php5/conf.d/memory_limit.ini":
            ensure => present,
            mode => 644,
            owner  => root,
            group  => root,
            source => "puppet:///modules/php/etc/php5/conf.d/memory_limit.ini",
            require => Package["php5"],
    }

    file
    {
        "/etc/php5/conf.d/max_time.ini":
            ensure => present,
            mode => 644,
            owner  => root,
            group  => root,
            source => "puppet:///modules/php/etc/php5/conf.d/max_time.ini",
            require => Package["php5"],
    }

    file
    {
        "/etc/php5/conf.d/timezone.ini":
            ensure => present,
            mode => 644,
            owner  => root,
            group  => root,
            source => "puppet:///modules/php/etc/php5/conf.d/timezone.ini",
            require => Package["php5"],
    }
}

define php::pear()
{
    include "php"

    package
    {
        "php5-${name}":
            ensure => latest,
            require => Package["php5"],
    }
}
