class shippingeasy-repo::www
{
  include "common"

  $webdir_full_path = "${common::web_path}"
  $repo             = "ssh://shippingeasy@gerrit.saturized.com:29418/shippingeasy.git"
  $branch           = "master"

  exec
  {
    "git-clone-${webdir_full_path}":
      path    => ["/usr/bin", "/bin"],
      command => "git clone -b ${branch} ${repo} ${webdir_full_path} && chown -R www-data:www-data ${webdir_full_path}",
      creates => "${webdir_full_path}",
      timeout => "-1",
      require =>
      [
        File["/root/.ssh/id_dsa"],
        Package["nginx"],
        Package["puppet"],
	      Exec["install-compass-rgbapng"],
      ],
  }

  exec
  {
    "git-submodule-${webdir_full_path}":
      path    => ["/usr/bin", "/bin"],
      command => "git submodule init && git submodule update && chown -R www-data:www-data .",
      cwd     => "${webdir_full_path}",
      creates => "${webdir_full_path}/web/js/modules/rate/.git",
      timeout => "-1",
      require => Exec["git-clone-${webdir_full_path}"]
  }

  file
  {
    "${webdir_full_path}/cache":
      ensure  => directory,
      owner   => "www-data",
      group   => "www-data",
      mode    => "755",
      require => Exec["git-clone-${webdir_full_path}"],
  }

  file
  {
    "${webdir_full_path}/log":
      ensure  => directory,
      owner   => "www-data",
      group   => "www-data",
      mode    => "755",
      require => Exec["git-clone-${webdir_full_path}"],
  }
}
