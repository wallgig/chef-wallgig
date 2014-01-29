include_recipe 'hostsfile'

hostsfile_entry '108.59.1.209' do
  hostname 'www.wallgig.net'
  aliases ['wallgig.net', 'cdn.wallgig.net', 'api.wallgig.net']
  action :create
end
