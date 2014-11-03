ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/mocks'

RSpec::Mocks.configuration.syntax = [:should, :expect]

module MinitestRSpecMocksIntegration
  include ::RSpec::Mocks::ExampleMethods

  def before_setup
    ::RSpec::Mocks.setup
    super
  end

  def after_teardown
    super
    ::RSpec::Mocks.verify
  ensure
    ::RSpec::Mocks.teardown
  end
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include MinitestRSpecMocksIntegration
end
