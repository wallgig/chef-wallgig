include_recipe 'postgresql'
include_recipe 'postgresql::libpq'
include_recipe 'postgresql::server'

include_recipe 'chef-vault'
vault = chef_vault_item('databasesecrets', 'wallgig')

pg_user 'wallgig' do
  privileges superuser: false, createdb: false, login: true
  password vault['password']
end


pg_database 'wallgig_production' do
  owner 'wallgig'
  encoding 'utf8'
  template 'template0'
  locale 'en_US.UTF8'
end
