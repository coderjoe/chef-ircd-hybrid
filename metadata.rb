# Encoding: utf-8
name 'ircd-hybrid'
maintainer 'Joe Bauser'
maintainer_email 'coderjoe@coderjoe.net'
license 'All rights reserved'
description 'Installs/Configures ircd-hybrid'
long_description 'Installs/Configures ircd-hybrid'
version '0.2.0'

%w( build-essential subversion ).each do |pkg|
  depends pkg
end
