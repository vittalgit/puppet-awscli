# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class: `aws_powershell::install`
#
# This private class is meant to be called from `aws_powrshell`.
# It downloads the package and installs it.
#
class awscli::install {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  ensure_resource('file', $awscli::download_dir, {'ensure' => 'directory'} )

  case downcase($::osfamily) {
    'windows': {

      download_file { $::awscli::package_name :
        url                   => "${awscli::package_source}/${awscli::package_name}",
        destination_directory => $awscli::download_dir
      } ->

      package { 'AWSCLI64':
        ensure          => installed,
        provider        => windows,
        source          => "${awscli::download_dir}\\${awscli::package_name}",
        install_options => ['/qn']
      }
    }
    default: {
      fail('This module only works on Windows based systems.')
    }
  }
}
