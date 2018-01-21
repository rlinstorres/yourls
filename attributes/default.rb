#
# Cookbook:: yourls
# Attributes:: default
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

# Mysql Settings
default['yourls']['install_dir'] = '/var/www'
default['yourls']['yourls_db_user'] = 'yourls'
default['yourls']['yourls_db_name'] = 'yourls'
default['yourls']['yourls_db_pass'] = 'yourls'
default['yourls']['yourls_db_host'] = 'localhost'
default['yourls']['yourls_db_prefix'] = 'yourls_'

# Site Options
default['yourls']['yourls_hours_offset'] = '0'
default['yourls']['yourls_lang'] = ''
default['yourls']['yourls_unique_urls'] = 'true'
default['yourls']['yourls_private'] = 'true'
default['yourls']['yourls_cookiekey'] = ''

# Debug mode to output some internal information
default['yourls']['yourls_debug'] = 'false'

# URL Shortening settings
default['yourls']['yourls_url_convert'] = '36'
default['yourls']['yourls_reserved_keywords'] = %w(porn faggot sex nigger fuck cunt dick)

# User config settings
default['yourls']['yourls_config_path'] = '/var/www/yourls/user/'

# Apache Confs
default['yourls']['doc_root'] = '/var/www/yourls'
default['yourls']['server_name'] = 'myyourls.com'

# Necessary packages
default['yourls']['packages'] = %w(curl php php-curl php-mysql libapache2-mod-php)
