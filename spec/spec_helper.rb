# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.tty = true
  config.log_level = :error
end
