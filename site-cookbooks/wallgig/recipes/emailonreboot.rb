cookbook_file '/etc/init.d/email-on-reboot' do
  owner 'root'
  group 'root'
  mode '0755'
  source 'email-on-reboot'
  action :create
end

service 'email-on-reboot' do
  supports :start => true, :stop => false, :restart => false
  action [ :enable ]
end
