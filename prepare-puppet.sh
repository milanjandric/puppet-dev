#!/bin/bash

function echoIt()
{
    echo
    echo
    echo
}

apt-get update
apt-get -y install puppet puppetmaster git-core
rm -rf /etc/puppet
cd /etc
git clone git@github.com:milanjandric/puppet-dev.git puppet
#sed -i 's:START=no:START=yes:g' /etc/default/puppet
#puppet agent -t
/etc/init.d/puppetmaster restart
