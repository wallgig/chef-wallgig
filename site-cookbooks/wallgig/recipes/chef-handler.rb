chef_gem "chef-handler-mail"
gem "chef-handler-mail"

chef_handler "MailHandler" do
   source 'chef/handler/mail'
   arguments :to_address => "root"
   action :nothing
end.run_action(:enable)

node.override['graphite_reporting_handler']['graphite_host'] = '107.170.181.199'
node.override['graphite_reporting_handler']['metric_key'] = "chef.#{node.chef_environment}.node.#{(node['fqdn']||'').downcase.gsub('.', '_')}"

include_recipe 'graphite_reporting_handler'
