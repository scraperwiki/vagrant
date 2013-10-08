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
}

class scraperwiki-minimal-packages {

    package { 'language-pack-en':
      ensure => installed,
      require => Exec['apt-get update'],
    }
   
    package { 'git':
      ensure => 'installed',
      require => Exec['apt-get update'],
    }
    
    package { 'vim-nox':
      ensure => 'installed',
      require => Exec['apt-get update'],
    }

    package { 'python-virtualenv':
      ensure => 'installed',
      require => Exec['apt-get update'],
    }
}

class python-poppler {

    package { 'libpoppler-glib8':
      ensure => '0.24.1-0ubuntu2~raring1',
      require => Exec['apt-get update'],
    }
    
    package { 'python-poppler':
      ensure => installed,
      require => Exec['apt-get update'],
    }
    
    package { 'python-cairo':
      ensure => installed,
      require => Exec['apt-get update'],
    }
 
}

class python-lxml-requirements {

    package { 'python2.7-dev' :
      ensure => installed
    }
    
    package { 'libxml2-dev' :
      ensure => installed
    }

    package { 'libxslt1-dev' :
      ensure => installed
    }

    package { 'lib32z1-dev' :
      ensure => installed
    }

}

include scraperwiki-raring-backports
include scraperwiki-minimal-packages
include python-poppler
include python-lxml-requirements
