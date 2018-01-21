#
# Cookbook:: yourls
# Recipe:: default
#
# Copyright:: 2018, Jailson Silva <jailson.silva@outlook.com.br>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

node.normal['apache']['mpm'] = 'prefork'
include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'php'

# Usage examples below

# yourls_install 'My Yourls' do
#   version '1.7.2'
#   path    '/var/www/yourls'
#   site    'http://myyourls.com'
# end

# web_app 'yourls' do
#   server_name         node['yourls']['server_name']
#   docroot             node['yourls']['doc_root']
#   template            'vhost.conf.erb'
#   directory_index     'index.php'
#   allow_override      'All'
# end
