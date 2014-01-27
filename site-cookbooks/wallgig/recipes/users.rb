#
# Cookbook Name:: base
# Recipe:: users
#

include_recipe 'user'
include_recipe 'chef-vault'

# Omnibus packages include ruby-shadow
users = data_bag('users')
sysadmins = []
users.each do |user_name|
  user  = data_bag_item('users', user_name)
  vault = chef_vault_item('usersecrets', user_name)
  sysadmins << user['username'] if user['admin']
  user_account user['username'] do
    comment   user['comment']
    shell     user['shell']
    password  vault['password']
    ssh_keys  user['ssh_keys']
    ssh_keygen false
    manage_home true
    only_if { user['hosts'].include?(node['fqdn']) }
  end

  group 'sysadmin' do
    gid 2300
    members sysadmins
    only_if { user['hosts'].include?(node['fqdn']) }
  end
end
