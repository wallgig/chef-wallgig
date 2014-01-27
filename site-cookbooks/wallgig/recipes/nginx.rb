#
# Cookbook Name:: gregf
# Recipe:: nginx
#


node.set['nginx']['default_site_enabled'] = false
include_recipe 'nginx'
include_recipe 'nginx::http_stub_status_module'

app_env = "#{node["application"]["name"]}-#{node["application"]["rails_env"]}"

template "#{node['nginx']['dir']}/sites-available/#{app_env}.conf" do
  source 'nginx_application.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  action :create
  variables(
    name:       node['application']['name'],
    rails_env:  node['application']['rails_env'],
    rails_root: node['application']['rails_root'],
    app_server: node['application']['app_server'],
    log_dir:    node['nginx']['log_dir']
  )
  notifies :reload, "service[nginx]", :immediately
end

nginx_site "#{app_env}.conf" do
  enable true
end
