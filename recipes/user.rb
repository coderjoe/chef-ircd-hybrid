# Encoding: utf-8
ircd_user = node[:ircd][:user]
ircd_group = node[:ircd][:group]

group ircd_group do
  system true
end

user ircd_user do
  gid ircd_group
  shell '/bin/false'
  comment 'The IRCd Hybrid System User'
  system true
end
