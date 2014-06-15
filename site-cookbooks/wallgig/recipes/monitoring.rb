include_recipe 'collectd::client'

%w(disk entropy memory swap cpu nginx processes df load users uptime).each do |plug|
  collectd_plugin plug
end

collectd_plugin 'tcpconns' do
  options :listening_ports => true
end

collectd_plugin 'interface' do
  options :interface => 'eth0'
end

collectd_plugin 'ntpd' do
  options :host => "localhost",
          :port => "123",
          :reverselookups => false
end

collectd_plugin 'nginx' do
  options :url => 'http://localhost:8090/nginx_status'
end

cookbook_file '/etc/collectd/plugins/iptables.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  source 'iptables.conf'
  action :create
end

collectd_plugin 'network' do
  options :server => 'monitoring.gregf.org'
end
