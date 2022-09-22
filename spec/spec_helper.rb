require "simplecov"
SimpleCov.start

require_relative 'cypher_spec'
# require_relative
# require_relative


RSpec.configure do |config|
  config.formatter = :documentation
end