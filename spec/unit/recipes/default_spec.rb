#
# Cookbook:: yourls
# Spec:: default
#
# Copyright:: 2018, Jailson Silva, All Rights Reserved.

require 'spec_helper'

describe 'yourls::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04', step_into: ['yourls_install'])
      runner.converge(described_recipe)
    end

    it 'Converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Git Clone' do
      expect(chef_run).to sync_git('yourls').with(
        repository: 'https://github.com/YOURLS/YOURLS.git',
        destination: '/var/www/yourls',
        revision: '1.7.2'
      )
    end

    it 'Create template config.php' do
      expect(chef_run).to create_template('/var/www/yourls/user/config.php').with(
        owner: 'www-data',
        group: 'www-data',
        mode: '0644'
      )
    end

    before do
      stub_command('/usr/sbin/apache2 -t').and_return(true)
    end

    it 'Include Apache2 recipe' do
      expect(chef_run).to include_recipe('apache2')
    end

    it 'Include recipe apache2::mod_rewrite' do
      expect(chef_run).to include_recipe('apache2::mod_rewrite')
    end

    it 'Include recipe php' do
      expect(chef_run).to include_recipe('php')
    end

    let(:packages) do
      %w(curl php php-curl php-mysql libapache2-mod-php)
    end
    it 'Install necessary packages' do
      packages.each do |pkg|
        expect(chef_run).to install_package(pkg)
      end
    end

    it 'Install Short URL' do
      expect(chef_run).to install_yourls_install('My Yourls').with(
        version:  '1.7.2',
        path:     '/var/www/yourls',
        site:     'http://myyourls.com'
      )
    end

    it 'Change owner to user apache' do
      expect(chef_run).to run_execute('Set user apache')
    end
  end
end
