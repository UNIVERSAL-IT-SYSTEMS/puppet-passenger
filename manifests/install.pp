class passenger::install {

  if $passenger::package_provider == 'portage' {
    portage::package { $passenger::package_name:
      ensure   => $passenger::package_ensure,
      keywords => $passenger::gentoo_keywords,
      use      => $passenger::gentoo_use,
      target   => 'passenger',
    }
  } else {
    package { 'passenger':
      ensure   => $passenger::package_ensure,
      name     => $passenger::package_name,
      provider => $passenger::package_provider,
    }
  }

  if $passenger::package_dependencies {
    package { $passenger::package_dependencies:
      ensure => present,
    }
  }

}
