# provisions iptables firewall rules restricting all ports except ssh
include_recipe 'simple_iptables'
simple_iptables_policy 'INPUT' do
  policy 'DROP'
end
simple_iptables_rule 'lo' do
  rule '-i lo'
  jump 'ACCEPT'
end
simple_iptables_rule 'state' do
  rule '-m conntrack --ctstate ESTABLISHED,RELATED'
  jump 'ACCEPT'
end
simple_iptables_rule 'icmp' do
  rule '-p icmp'
  jump 'ACCEPT'
end
simple_iptables_rule 'ssh' do
  rule '-p tcp --dport 22'
  jump 'ACCEPT'
end
simple_iptables_rule 'http' do
  rule [ "--proto tcp --dport 80",
        "--proto tcp --dport 443" ]
  jump 'ACCEPT'
end

simple_iptables_rule "bad-bot" do
  rule '-s 129.21.129.165/32'
  jump "DROP"
end
