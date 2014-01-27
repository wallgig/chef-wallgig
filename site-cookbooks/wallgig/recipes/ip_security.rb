#
# Cookbook Name:: base
# Recipe:: ip_security
#

include_recipe 'sysctl'

sysctl_param 'net.ipv4.tcp_timestamps' do
  value 0
end

sysctl_param 'net.ipv4.tcp_syncookies' do
  value 1
end

sysctl_param 'net.ipv4.ip_forward' do
  value 0
end

sysctl_param 'net.ipv4.icmp_echo_ignore_broadcasts' do
  value 1
end

sysctl_param 'net.ipv4.conf.all.log_martians' do
  value 1
end

sysctl_param 'net.ipv4.icmp_ignore_bogus_error_responses' do
  value 1
end

sysctl_param 'net.ipv4.conf.all.rp_filter' do
  value 1
end

sysctl_param 'net.ipv4.conf.all.send_redirects' do
  value 0
end

sysctl_param 'net.ipv4.conf.all.accept_source_route' do
  value 0
end
