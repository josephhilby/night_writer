require 'pry'

require 'rspec'
require './lib/cypher'
require './lib/formatter'

RSpec.describe Formatter do
  before(:each) do
    @formatter = Formatter.new(["O.O.  "], ["OOOO  "], ["....  "])

    @cypher = Cypher.new('Hh ')
    @cypher.encode
    @formatter_with_cypher = Formatter.new(@cypher.encoded_line_1,
                                           @cypher.encoded_line_2,
                                           @cypher.encoded_line_3)

    @long_cypher = Cypher.new('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')
    @long_cypher.encode
    @formatter_with_long_cypher = Formatter.new(@long_cypher.encoded_line_1,
                                                @long_cypher.encoded_line_2,
                                                @long_cypher.encoded_line_3)
  end

  context "Initilize" do
    it "#exitst" do
      expect(@formatter).to be_a(Formatter)
    end

    it "#readable" do
      expect(@formatter.encrypted_message).to eq(nil)
    end
  end

  context "Methods" do

    it "#line_split" do
      expect(@formatter.line_split).to eq(["....  "])
    end

    it "#line_break" do
      expect(@formatter.line_break).to eq(["....  \n"])
    end

    it "#merge" do
      @formatter.merge
      expect(@formatter.encrypted_message).to eq("O.O.  \nOOOO  \n....  ")
    end
  end
end