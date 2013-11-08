class nginx {
    package { 'apache-2.2-common': 
        ensure => absent 
    }

    package { 'nginx': 
        ensure => installed 
    }

    service { 'nginx': 
        ensure => running, 
        require => Package['nginx'],
    }

    file { '/etc/nginx/sites-enabled/default': 
        ensure => absent,
    }

    file { '/var/www/cat-pictures/index.html': 
        source => 'puppet:///modules/nginx/index.html',
    }
}
