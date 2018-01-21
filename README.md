# Yourls Cookbook

This cookbook provides a Debian/Ubuntu 16.04 installation e configuration for shorter url [Yourls](http://yourls.org/#Install).

## Cookbooks:

This cookbook has some dependencies.

 - cookbook 'php', '~> 4.5.0'

 - cookbook 'apache2', '~> 5.0.1'

That dependencies it's gonna be resolved by berkshelf using CHEF supermaket.

Before run this recipe you need run berks for download and install dependencies

```
berks vendor <your_cookbooks_path>
```
 
Chefdk is required.

## Platforms:

This cookbook has been tested on this plataforms:

:point_right: Debian/Ubuntu 16.04

# Usage

You can use this cookbook straightforward.It is recommended to create a project or organization specific [wrapper cookbook](https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/) and add the desired attributes. Depending on your environment, you may have multiple attributes that use different recipes from this cookbook. Adjust any attributes as desired.

The example below can be used after you include this recipe.

```
yourls_install 'teste' do
  version '1.7.2'
  path    '/var/www/yourls'
  site    'http://yourls.com'
end
```

 - Set 'http' or 'https' of site is required that's will be use to render config.php template.

 - For examples of using the definitions in your own recipes, see their respective sections below.

 - After that just point your browser to http://your-own-domain-here.com/admin/ and click on install.

# Attributes

# Mysql Settings

These are attributes used to define Mysql settings.

- `node['yourls']['yourls_db_user']` - Database user default yourls

- `node['yourls']['yourls_db_name']` - Database name default yourls

- `node['yourls']['yourls_db_pass'`] - Database password node yourls

- `node['yourls']['yourls_db_host']` - Database host default localhost

# Site Options

These are attributes used to define install path we use to render template config.php and vhost

- `node['yourls']['yourls_site']`  - Default 'http://yourls.com'

- `node['yourls']['yourls_hours_offset']` - Default '0'

- `node['yourls']['yourls_lang']` - Default ''

- `node['yourls']['yourls_unique_urls']` - Default 'true'

- `node['yourls']['yourls_private']` - Default 'true'

- `node['yourls']['yourls_cookiekey']` - Default ''

- `node['yourls']['install_dir']` - Default'/var/www'

- `node['yourls']['yourls_db_prefix']` - Default  'yourls_'

# Debug mode to output some internal information
- `node['yourls']['yourls_debug']` - Default 'false'

# URL Shortening settings
- `node['yourls']['yourls_url_convert']` - Default '36'

- `node['yourls']['yourls_reserved_keywords']` Default %w(porn faggot sex nigger fuck cunt dick)

# User config settings
- `node['yourls']['yourls_config_path']` - Default '/var/www/yourls/user/'

# Apache Confs
- `node['yourls']['doc_root']` - Default '/var/www/yourls'

- `node['yourls']['server_name']` - Default 'yourls.com'

# Necessaries packages

- `node['yourls']['packages']` - Default %w(curl php php-curl php-mysql libapache2-mod-php)


# Important considerations

Yourls needs its own .htaccess and gonna generated on fisrt instalation, this recipe has example of this file and can be used if you want or let yourls generate it.