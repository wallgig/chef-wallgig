include_recipe 'sidekiq'

sidekiq 'wallgig.net' do
  concurrency 15
  processes 2
  queues 'wallpapers' => 7, 'default' => 5, 'low' => 3
  owner 'wallgig'
  group 'wallgig'
end
