# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property  :version, String
property  :path, String
property  :site, String
property  :configfile, String, default: 'user/config.php'

action :install do
  git 'yourls' do
    repository 'https://github.com/YOURLS/YOURLS.git'
    revision new_resource.version
    destination new_resource.path
  end

  node['yourls']['packages'].each do |pkg|
    package pkg do
      action :install
      options '--force-yes'
    end
  end

  template "#{new_resource.path}/#{new_resource.configfile}" do
    source 'config.php.erb'
    owner node['apache']['user']
    group node['apache']['group']
    mode '0644'
    variables(
      site:   new_resource.site
    )
  end

  execute 'Set user apache' do
    command "chown -R #{node['apache']['user']}:#{node['apache']['group']} #{new_resource.path}"
  end
end
