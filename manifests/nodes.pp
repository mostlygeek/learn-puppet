node 'demo' {
    include ssh
    include sudoers

    class { 'ntp': server => 'us.pool.ntp.org' }

    user { 'art' : 
        ensure     => present,
        comment    => 'Art Vandelay',
        home       => '/home/art',
        managehome => true,
        password   => '*'
    }

    ssh_authorized_key { 'art_ssh': 
        user => 'art', 
        type => 'rsa',
        key  => 'thisIsNotARealKey2'
    }

    Exec {
        path => ['/bin', '/usr/bin']
    }

    exec { 'Run some arbitrary command': 
        command => 'echo I ran this on `date` > /tmp/command.output.txt'
    }


    nginx::website { 'adorable-animals': site_domain => 'adorable-animals.com', }
    nginx::website { 'adorable-dogs': site_domain => 'adorable-dogs.com', }
    nginx::website { 'adorable-cats': site_domain => 'adorable-cats.com', }

    file { '/etc/nginx/sites-enabled/adorable-animatls.conf': ensure => absent}

}
