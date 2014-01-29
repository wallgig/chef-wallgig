include_recipe 'chef-vault'

datadog_vault = chef_vault_item('secrets', 'datadog')

node.set['datadog']['api_key'] = datadog_vault['api_key']
node.set['datadog']['application_key'] = datadog_vault['application_key']

# Elasticsearch integration
if node['elasticsearch']
  node.set['datadog']['elasticsearch']['instances'] = [
    'url' => "http://localhost:9200"
  ]
end

# Nginx integration
if node['nginx']
  node.set['datadog']['nginx']['instances'] = [
    'nginx_status_url' => "http://127.0.0.1:8090/nginx_status/"
  ]
end

# Chef handler
include_recipe 'datadog'
include_recipe 'datadog::dd-handler'
include_recipe 'datadog::nginx'
include_recipe 'datadog::elasticsearch'

# Agent config
include_recipe "datadog::dd-agent"
