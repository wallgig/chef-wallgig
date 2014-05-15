node.override['authorization']['sudo'] = {
  passwordless: true,
  include_sudoers_d: true,
  sudoers_defaults: [
    'env_reset',
    'secure_path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  ]
}

include_recipe 'sudo'

sudo 'wallgig' do
  user 'wallgig'
  commands  ['/etc/init.d/sidekiq-wallgig.net', '/etc/init.d/puma-wallgig.net']
  nopasswd true
end
