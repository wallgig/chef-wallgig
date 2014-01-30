node.set['rbenv']['group_users'] = %w{wallgig toor}

include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

rbenv_ruby 'Ruby 2.0' do
  ruby_verson '2.0.0-p353'
  global true
end

rbenv_gem 'bundler'
