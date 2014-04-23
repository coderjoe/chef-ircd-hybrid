include_recipe "ircd-hybrid::source"
include_recipe "subversion::client"

ircd_user = node[:ircd][:user]
ircd_group = node[:ircd][:group]
svn_repo = node[:ircd][:repository][:uri]
svn_revision = node[:ircd][:repository][:revision]
source_directory = node[:ircd][:source][:directory]

subversion "ircd-hybrid" do
	repository svn_repo
	revision svn_revision
	destination source_directory
	user ircd_user
	group ircd_group
	action :sync
end
