require 'pry'

require 'rspec'
require './lib/cypher'

RSpec.describe Cypher do
  before(:each) do
    @cypher = Cypher.new('Hh ')
  end

  context "Initilize" do
    it "#exitst" do
      expect(@cypher).to be_a(Cypher)
    end

    it "#readable" do
      expect(@cypher.simple_cypher_line_1).to be_a(Hash)
      expect(@cypher.simple_cypher_line_2).to be_a(Hash)
      expect(@cypher.simple_cypher_line_3).to be_a(Hash)
      expect(@cypher.input).to be_a(String)
    end
  end

  context "Methods" do
    it "#line_break" do
    end
  end
end