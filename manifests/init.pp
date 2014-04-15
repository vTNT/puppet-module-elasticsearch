class elasticsearch {

  include elasticsearch::install
  include elasticsearch::service

  Class['elasticsearch::install'] -> Class['elasticsearch::service']
}
