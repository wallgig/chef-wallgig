current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "gregf"
client_key               "#{current_dir}/gregf.pem"
validation_client_name   "wgig-validator"
validation_key           "#{current_dir}/wgig-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/wgig"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
chef_repo_path "#{current_dir}/../"
repo_mode "everything"
cookbook_path [ 
  "#{current_dir}/../cookbooks", 
  "#{current_dir}/../site-cookbooks"
]

knife[:vault_mode] = 'client'
