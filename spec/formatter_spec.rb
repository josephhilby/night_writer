require 'rspec'
require './lib/red_fill'
require './lib/cypher'
require './lib/formatter'

RSpec.describe Formatter do
  before(:each) do
    @formatter = Formatter.new(["O.O.  "], ["OOOO  "], ["....  "])

    r_fill = RedFill.new
    cypher = Cypher.new('Hello World', r_fill.red_fill_1, r_fill.red_fill_2, r_fill.red_fill_3)
    cypher.encode
    @formatter_with_cypher = Formatter.new(cypher.encoded_line_1,
                                           cypher.encoded_line_2,
                                           cypher.encoded_line_3)
    @formatter_with_cypher.merge
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
      expect(@formatter.line_end_break).to eq(["....  \n"])
    end

    it "#merge" do
      @formatter.merge
      expect(@formatter.encrypted_message).to eq("O.O.  \nOOOO  \n....  ")
      expect(@formatter_with_cypher.encrypted_message).to eq("O.O.O.O.O.  .OO.O.O.OO\nOO.OO.O..O  OO.OOOO..O\n....O.O.O.  .OO.O.O...")
    end
  end
end