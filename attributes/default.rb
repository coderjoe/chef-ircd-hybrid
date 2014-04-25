# Encoding: utf-8
# rubocop:disable LineLength
default[:ircd][:user] = 'ircd'
default[:ircd][:group] = 'ircd'
default[:ircd][:directory] = '/usr/local/ircd'

default[:ircd][:repository][:uri] = 'svn://svn.ircd-hybrid.org/svnroot/ircd-hybrid/releases/8.1.16'
default[:ircd][:repository][:revision] = 'HEAD'

default[:ircd][:source][:directory] = '/usr/local/ircd/src'
default[:ircd][:source][:openssl] = false
default[:ircd][:source][:openssl_dir] = nil
