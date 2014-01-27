node.set['poise-ruby']['ruby'] = 'ruby-200'

include_recipe 'poise-ruby'

poise_ruby 'ruby-200' do
  version '2.0.0-p353'
end

gem_package 'bundler' do
  gem_binary '/opt/ruby-200/bin/gem'
end

file '/etc/profile.d/ruby.sh' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  content 'export PATH="$PATH:/opt/ruby-200/bin"'
end
