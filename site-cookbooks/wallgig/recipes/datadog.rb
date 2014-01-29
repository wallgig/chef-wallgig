include_recipe 'chef-vault'

datadog_vault = chef_vault_item('secrets', 'datadog')

node.set['datadog']['api_key'] = datadog_vault['api_key']
node.set['datadog']['application_key'] = datadog_vault['application_key']

# Chef handler
include_recipe "datadog::dd-handler"

# Redis integration
if node['redis']
  package "python-redis"
  node.set['datadog']['redis']['server']['addr'] = node['redis']['bind']
  node.set['redis']['server']['port'] = node['redis']['port']
end

# Nginx integration
if node['nginx']
  node.set['datadog']['nginx']['status_url'] = "http://127.0.0.1:8090/nginx_status/"
end

# Agent config
include_recipe "datadog::dd-agent"
