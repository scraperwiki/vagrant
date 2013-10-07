group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':                                                       
  content => "Welcome to your Vagrant-built virtual machine!
              Managed by Puppet for ScraperWiki\n"
}

class scraperwiki-raring-backports {
    
    exec { 'add-backports-repository':
    command => 'add-apt-repository ppa:scraperwiki/raring-backports',
    path => '/usr/bin/',
    }
    
    exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => Exec['add-backports-repository']
    }
    
    package { 'libpoppler-glib8':
    ensure => '0.24.1-0ubuntu2~raring1',
    require => Exec['apt-get update'],
    }
}
include scraperwiki-raring-backports
