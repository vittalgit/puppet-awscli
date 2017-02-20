# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT
#

# == Class: `aws_powershell::params`
#
# This private class is meant to be called from `aws_powrshell`.
# It sets the vairables according to platform
#
class awscli::params {
  $package_name     = 'AWSCLI64.msi'
  $package_source   = 'https://s3.amazonaws.com/aws-cli'
  $download_dir     = 'c:\temp'
}
