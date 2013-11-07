node 'demo' {
    include nginx
    include ssh
    include sudoers

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
}
