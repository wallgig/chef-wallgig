include_recipe 'ruby_install'

ruby_install_ruby 'ruby 2.1.2'
gem_package 'bundler' do
  gem_binary '/opt/rubies/ruby-2.1.2/bin/gem'
  options '--no-ri --no-rdoc'
end

%w(ruby gem ri rdoc irb erb testrb rake bundle).each do |prg|
  link "/usr/bin/#{prg}" do
    to "/opt/rubies/ruby-2.1.2/bin/#{prg}"
  end
end

file '/etc/profile.d/ruby.sh' do
  owner 'root'
  group 'root'
  mode '0755'
  content 'export PATH=/opt/rubies/ruby-2.1.2/bin:$PATH'
  action :create
end
