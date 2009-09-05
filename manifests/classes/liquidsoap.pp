class liquidsoap {

  # TODO don't install recommended icecast2
  package { liquidsoap: }

  file { "/var/lib/liquidsoap":
    ensure => directory
  }
  file { "/var/lib/liquidsoap/tune.ogg":
    source => "$source_base/files/liquidsoap/tune.ogg"
  }
  file { "/var/lib/liquidsoap/test.liq":
    source => "$source_base/files/liquidsoap/tune.liq"
  }
  file { "/etc/liquidsoap/test.liq":
    ensure => "/var/lib/liquidsoap/test.liq"
  }
  exec { "add-liquidsoap-user-to-audio-group":
    command => "adduser liquidsoap audio",
    unless => "grep '^audio:.*liquidsoap' /etc/group",
    require => Package[liquidsoap]
  }

}

class liquidsoap::readonly {
  include readonly::common
  include liquidsoap

  file { "/var/log.model/liquidsoap":
    ensure => directory,
    owner => liquidsoap,
    require => Package[liquidsoap]
  }
  file { "/etc/init.d/liquidsoap":
    mode => 755,
    source => "$source_base/files/liquidsoap/liquidsoap.initd",
    require => Package[liquidsoap]
  }
}
