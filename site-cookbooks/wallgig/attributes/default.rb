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
default['application']['rails_root'] = '/home/wallgig/www'
default['application']['app_server'] = 'puma'
default['application']['application_port'] = '9000'
