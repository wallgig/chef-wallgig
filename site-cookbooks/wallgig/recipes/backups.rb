include_recipe 'tarsnap'

# Create pgsql backup script
template '/usr/local/sbin/backup_pgsql.sh' do
  source 'backup_pgsql.sh.erb'
  owner  'root'
  group  'root'
  mode   '0755'
  variables({
    conf: node['wallgig']['pg_backups']
  })
  action :create
end

cron_d 'nightly-pgsql-backup' do
  minute 0
  hour 21
  command '/usr/local/sbin/backup_pgsql.sh'
  user 'wallgig'
end

tarsnap_backup 'pgsql-dump' do
  path node['wallgig']['pg_backups']['backup_base_dir']
  schedule 'daily'
end

tarsnap_schedule 'monthly' do
  period 2592000 # 30 days
  always_keep 2
  before '0600'
end

tarsnap_schedule 'weekly' do
  period 604800 # 7 days
  always_keep 4
  after '0200'
  before '0600'
  implies 'monthly'
end

tarsnap_schedule 'daily' do
  period 86400 # 1 day
  always_keep 7
  after '0200'
  before '0600'
  implies 'weekly'
end

tarsnap_schedule 'hourly' do
  period 3600 # 1 hour
  always_keep 24
  implies 'daily'
end

tarsnap_schedule 'realtime' do
  period 900 # 15 minutes
  always_keep 10
  implies 'hourly'
end
