name 'wallgig'
maintainer       'Greg Fitzgerald'
maintainer_email 'greg@gregf.org'
license          'Apache 2.0'
description      'wallgig.net specific recipes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'

recipe 'base', 'Default recipes'
recipe 'base::users', 'User setup and configuration'
recipe 'base::nginx', 'Adds any nginx configuration/sites'

depends 'user'
depends 'monit'
depends 'nginx'
depends 'chef-vault'
depends 'sysctl'
depends 'poise-ruby'
depends 'postgresql'
depends 'simple_iptables'