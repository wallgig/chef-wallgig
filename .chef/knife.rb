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
encrypted_data_bag_secret "#{current_dir}/databag.key"

# http://jtimberman.housepub.org/blog/2013/02/01/local-only-knife-configuration/
if ::File.exist?(File.expand_path("../knife.local.rb", __FILE__))
  Chef::Config.from_file(File.expand_path("../knife.local.rb", __FILE__))
end
