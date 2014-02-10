#
# Cookbook Name:: base
# Attributes:: default
#
# Copyright 2013, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['application']['name'] = 'wallgig'
default['application']['rails_env'] = 'production'
default['application']['rails_root'] = '/srv/www/wallgig.net'
default['application']['app_server'] = 'puma'
default['application']['application_port'] = '9000'

default['wallgig']['pg_backups']['backup_base_dir'] = '/home/wallgig/backups'
default['wallgig']['pg_backups']['dbname'] = 'wallgig_production'
default['wallgig']['pg_backups']['days_to_keep'] = '+7'
default['wallgig']['pg_backups']['date_format'] = '%Y.%m.%d-%I.%M'
default['wallgig']['pg_backups']['pg_dump'] = '/usr/bin/pg_dump'
