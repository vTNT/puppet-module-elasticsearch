class elasticsearch::service(
        $es_host = "127.0.0.1",
) {
      file {"elasticsearch.yml":
        mode    => 644,
        owner   => root,
        group   => root,
        path    => "/etc/elasticsearch/elasticsearch.yml",
        content => template('elasticsearch/elasticsearch.erb'),
        require => Class["elasticsearch::install"],
        notify  => Service['elasticsearch']
      }

      service { "elasticsearch":
        ensure  => running,
        enable  => true,
        subscribe => File['elasticsearch.yml']
      }
   }
