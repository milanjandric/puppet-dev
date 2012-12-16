#!/bin/bash

function echoIt()
{
    echo
    echo
    echo
}
echoIt | ssh-keygen -t dsa
cat ~/.ssh/id_dsa.pub
echo 'Press <Enter> when you add public key to github'
read

echo '|1|nGIXUEZeb7XnrqneMHDG570l/co=|1GOmyobbBLdbWrE9RfZDTze7YWI= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >~/.ssh/known_hosts
echo '|1|cSVM2wjShkjBxq1PRaS0sE1Pa+Q=|Oe30V88fYK0+R24yp6hDlhxfoGA= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >>~/.ssh/known_hosts

apt-get update
apt-get -y install puppet puppetmaster git-core
rm -rf /etc/puppet
cd /etc
git clone git@github.com:milanjandric/puppet-dev.git puppet
#sed -i 's:START=no:START=yes:g' /etc/default/puppet
#puppet agent -t
/etc/init.d/puppetmaster restart
