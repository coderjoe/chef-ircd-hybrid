# Encoding: utf-8
include_recipe 'ircd-hybrid::user'

directory node[:ircd][:source][:directory] do
  owner node[:ircd][:user]
  group node[:ircd][:group]
  mode 0750
  recursive true
  action :create
end

include_recipe 'ircd-hybrid::subversion'
include_recipe 'ircd-hybrid::build'
