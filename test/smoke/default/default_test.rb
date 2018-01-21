# # encoding: utf-8

# Inspec test for recipe yourls::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

# Describe service apache
describe service('apache2') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# Describlle instalation
describe file '/var/www/yourls' do
  it { should be_directory }
  its('owner') { should eq 'www-data' }
end
