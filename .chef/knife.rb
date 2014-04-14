current_dir = File.dirname(__FILE__)
user_email  = `git config --get user.email`
home_dir    = ENV['HOME'] || ENV['HOMEDRIVE']
org         = ENV['chef_org'] || 'wgig'
user        = ENV['USER'].downcase

chef_server_url          "https://api.opscode.com/organizations/#{org}"
log_level                :info
log_location             STDOUT

node_name                user
client_key               "#{home_dir}/.chef/#{user}.pem"
cache_type               'BasicFile'
cache_options(:path => "#{home_dir}/.chef/checksums")

validation_client_name   "#{org}-validator"
validation_key           "#{current_dir}/#{org}-validator.pem"

# We keep our cookbooks in separate repos under a ~/chef/cookbooks dir
cookbook_path            ["#{current_dir}/../cookbooks", 
                          "#{current_dir}/../site-cookbooks"]
cookbook_copyright       'Wallgig.net'
cookbook_license         'Apache 2'
cookbook_email           "#{user_email}"

# Tell chef-vault we are using chef server.
knife[:vault_mode] = 'client'
knife[:vault_admins] = [ 'gregf', 'jianyuan' ]

# knife essentials settings
repo_mode 'everything'
