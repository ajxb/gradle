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
# Adam Butler <adam.j.butler@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Karol Kozakowski.
#
class gradle (
  $version = '3.0',
  $target = '/opt',
  $gradle_opts = undef,
  $deamon = true,
  ) {

    if !defined(Package['unzip']) {
      package {'unzip':
        ensure => present,
      }
    }

    $download_url = "https://services.gradle.org/distributions/gradle-${version}-all.zip"
    $gradle_home = "${target}/gradle"

    archive { "/tmp/gradle-${version}.zip":
      ensure       => present,
      source       => $download_url,
      extract      => true,
      extract_path => $target,
      require      => Package['unzip'],
    }

    file { '/opt/gradle':
      ensure  => link,
      target  => "/opt/gradle-${version}",
      require => Archive["/tmp/gradle-${version}.zip"],
    }

    file { '/etc/profile.d/gradle.sh':
      ensure  => file,
      mode    => '0644',
      content => template("${module_name}/gradle.sh.erb"),
      before  => Exec['source gradle.sh'],
    }

    exec { 'source gradle.sh':
      command => "/bin/bash -c 'source /etc/profile.d/gradle.sh'",
    }
}
