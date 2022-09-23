require "simplecov"
SimpleCov.start

require_relative 'red_fill_spec'
require_relative 'cypher_spec'
require_relative 'formatter_spec'


RSpec.configure do |config|
  config.formatter = :documentation
end