current_dir = File.dirname(__FILE__)
user_email  = `git config --get user.email`
home_dir    = ENV['HOME'] || ENV['HOMEDRIVE']
org         = ENV['chef_org'] || 'wgig'

knife_override = "#{home_dir}/.chef/knife_override.rb"

chef_server_url          "https://api.opscode.com/organizations/#{org}"
log_level                :info
log_location             STDOUT

# USERNAME is UPPERCASE in Windows, but lowercase in the Chef server,
# so `downcase` it.
node_name                ( ENV['USER'] || ENV['USERNAME'] ).downcase
client_key               "#{home_dir}/.chef/#{node_name}.pem"
cache_type               'BasicFile'
cache_options( :path => "#{home_dir}/.chef/checksums" )

validation_client_name   "#{org}-validator"
validation_key           "#{current_dir}/#{org}-validator.pem"

# We keep our cookbooks in separate repos under a ~/chef/cookbooks dir
cookbook_path            ["#{current_dir}/../../../cookbooks"]
cookbook_copyright       "Wallgig.net"
cookbook_license         "Apache 2"
cookbook_email           "#{user_email}"

# Allow overriding values in this knife.rb
Chef::Config.from_file(knife_override) if File.exist?(knife_override)

# Tell chef-vault we are using chef server.
knife[:vault_mode] = 'client'

# knife essentials settings
repo_mode "everything"
