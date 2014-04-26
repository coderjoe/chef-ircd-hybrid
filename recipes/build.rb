# Encoding: utf-8
include_recipe 'build-essential'

ircd_user = node[:ircd][:user]
ircd_group = node[:ircd][:group]
ircd_install_dir = node[:ircd][:directory]
ircd_source_dir = node[:ircd][:source][:directory]

# Set up the default options
config_options = []
config_options.push "--prefix=\"#{ircd_install_dir}\""

# If OpenSSL is requested install and enable it
if node[:ircd][:source][:openssl]
  package 'libssl-dev'
  ssl_opt = '--enable-openssl'

  unless node[:ircd][:source][:openssl_dir].nil?
    ssl_opt += "=\"#{node[:ircd][:source][:openssl_dir]}\""
  end

  config_options.push ssl_opt
end

# Configure our source
bash 'configure' do
  cwd ircd_source_dir
  user ircd_user
  group ircd_group
  code "./configure #{config_options.join(' ')}"
end

# build source code
bash 'make' do
  cwd ircd_source_dir
  user ircd_user
  group ircd_group
  code 'make'
end

directory ircd_install_dir do
  owner ircd_user
  group ircd_group
  mode 0750
  recursive true
end

# Install the built source code
bash 'make install' do
  cwd ircd_source_dir
  user ircd_user
  group ircd_group
  code 'make install'
end
