require "simplecov"
SimpleCov.start

require_relative 'simple_key_loader_spec'
require_relative 'cypher_spec'
require_relative 'bletchley_park_computer_spec'


RSpec.configure do |config|
  config.formatter = :documentation
  # config.profile_examples = true
end