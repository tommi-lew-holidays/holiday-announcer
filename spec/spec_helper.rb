require_relative File.join('..', 'config', 'shared.rb')

RACK_ENV = 'test'

# Load environment variables with dotenv gem
require 'dotenv'
Dotenv.load('.env.test')

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| require f }

require 'rspec'
require 'webmock/rspec'
require 'timecop'

include WebMock::API
include WebMock::Matchers

RSpec.configure do |config|
  config.mock_with :rspec
end

# Load custom definitions for testing
Holidays.load_custom("#{File.dirname(__FILE__)}/../spec/fixtures/holidays.yaml")