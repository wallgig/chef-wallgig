node.override['puma']['rubygems_location'] = '/usr/bin/gem'

include_recipe 'puma'

puma_config 'wallgig.net' do
  workers 2
  owner 'wallgig'
  group 'wallgig'
end
