node.set['rbenv']['group_users'] = %w{wallgig toor}

include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

rbenv_ruby '2.0.0-p353'

rbenv_gem 'bundler'
