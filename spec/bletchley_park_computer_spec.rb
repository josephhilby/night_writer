require 'pry'

require 'rspec'
require './lib/red_fill'
require './lib/cypher'
require './lib/formatter'
require './lib/bletchley_park'

RSpec.describe BletchleyParkComputer do
  before(:each) do
    fill = RedFill.new
    @cypher = Cypher.new('Hello World', fill.red_fill_1, fill.red_fill_2, fill.red_fill_3)
    @cypher.encode

    @formatter = Formatter.new(@cypher.encoded_line_1,
                               @cypher.encoded_line_2,
                               @cypher.encoded_line_3)
    incoming_msg = @formatter.merge

    @bombe = BletchleyParkComputer(incoming_msg, fill.red_fill_1, fill.red_fill_2, fill.red_fill_3)
  end

  context "Initilize" do
    it "#exitst" do
      expect(@bombe).to be_a(BletchleyParkComputer)
    end

    it "#readable" do
      expect(@formatter.decrypted_msg).to eq(nil)
    end
  end

  context "Methods" do
    it "#line_split" do

    end
  end
end