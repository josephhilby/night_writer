require 'rspec'
require './lib/red_fill'
require './lib/cypher'

RSpec.describe Cypher do
  before(:each) do
    fill = RedFill.new
    @cypher = Cypher.new('Hh ', fill.red_fill_1, fill.red_fill_2, fill.red_fill_3)
  end

  context "Initilize" do
    it "#exitst" do
      expect(@cypher).to be_a(Cypher)
    end

    it "#readable" do
      expect(@cypher.encoded_line_1).to eq(nil)
      expect(@cypher.encoded_line_2).to eq(nil)
      expect(@cypher.encoded_line_3).to eq(nil)
      expect(@cypher.input).to be_a(String)
    end
  end

  context "Methods" do
    it "#break_down" do
      expect(@cypher.break_down).to eq(['h', 'h', ' '])
    end

    it "#encode" do
      @cypher.encode
      expect(@cypher.encoded_line_1).to eq(["O.O.  "])
      expect(@cypher.encoded_line_2).to eq(["OOOO  "])
      expect(@cypher.encoded_line_3).to eq(["....  "])
    end
  end
end