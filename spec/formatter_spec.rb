require 'pry'

require 'rspec'
require './lib/cypher'
require './lib/formatter'

RSpec.describe Formatter do
  before(:each) do
    @formatter = Formatter.new
    @cypher = Cypher.new('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')
  end

  context "Initilize" do
    it "#exitst" do
      expect(@formatter).to be_a(Formatter)
    end

    it "#readable" do
      expect(@formatter.simple_cypher_line_1).to be_a(Hash)
    end
  end

  context "Methods" do

  end
end