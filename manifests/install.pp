class elasticsearch::install (
    $pkgname="java-1.7.0-openjdk"
){
    package {$pkgname:
        ensure  => present,
    }
    
    file {"es":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0644',
        path => '/tmp/elasticsearch-1.1.0.noarch.rpm',
        source => 'puppet:///modules/elasticsearch/elasticsearch-1.1.0.noarch.rpm', 
        require => Package["$pkgname"],
    }

    package {"elasticsearch":
        ensure  => present,
        provider => rpm,
        source   => "/tmp/elasticsearch-1.1.0.noarch.rpm",
        require => File["es"],
    }

}

