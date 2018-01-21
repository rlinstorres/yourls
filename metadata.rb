name 'yourls'
maintainer 'Jailson Silva'
maintainer_email 'jailson.silva@outlook.com.br'
license 'Apache v2.0'
description 'Installs/Configures yourls'
long_description 'Installs/Configures yourls'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/jailson-silva/chef-repo/issues'
source_url 'https://github.com/jailson-silva/chef-repo/tree/master/cookbooks/yourls'
supports 'ubuntu', '>=16.04'
license 'Apache-2.0'

depends 'apache2'
depends 'php'
