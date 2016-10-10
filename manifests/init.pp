# Class: gradle
# ===========================
#
# Gradle class that installs and manage Gradle build system.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `version`
# Gradle version that will be installed
#
# * `timeout`
# Timeout for archive downloading, by default 0.
#
# * `deamon`
# Should gradle be started with deamon option
#
# Examples
# --------
#
# @example
#    class { 'gradle':
#      version => '3.0',
#    }
#
# Authors
# -------
#
# Karol Kozakowski <cosaquee@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Karol Kozakowski.
#
class gradle (
  $version = '3.0',
  $timeout = '0',
  $deamon = true,
  ){

    $download_url = "https://services.gradle.org/distributions/gradle-${version}-all.zip"

    archive {"gradle-${$version}-all.zip":
      ensure     => present,
      url        => download_url,
      checksum   => false,
      src_target => '/var/tmp',
      target     => '/opt',
      root_dir   => "gradle-${version}",
      extension  => 'zip',
      timeout    => $timeout,
    }

    file { '/opt/gradle':
      ensure  => link,
      target  => "/opt/gradle-${version}",
      require => Archive["gradle-${version}-all.zip"],
    }

    file { '/etc/profile.d/gradle.sh':
      ensure  => file,
      mode    => '0644',
      content => template('gradle.sh.erb'),
    }
}
