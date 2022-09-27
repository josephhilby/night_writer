require 'rspec'
require './lib/bletchley_park_computer'

RSpec.describe BletchleyParkComputer do
  before(:each) do
    cypher = Cypher.new('hello')
    allow(cypher).to receive(:encrypted_message).and_return("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    incoming_msg = cypher.encrypted_message
    @bombe = BletchleyParkComputer.new(incoming_msg)
    @bombe.black_fill
  end

  context "Initilize" do
    it "#exitst" do
      expect(@bombe).to be_a(BletchleyParkComputer)
    end
  end

  context "Methods" do
    it "#file_split_by_line" do
      expect(@bombe.file_split_by_line).to eq(["0.0.0.0.0.", "00.00.0..0", "....0.0.0."])
    end

    it "#line_parts_join" do
      expect(@bombe.line_parts_join).to eq([ ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."] ])
    end

    it "#letter_split" do
      expect(@bombe.letter_split).to eq([ [ ["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."] ] ])
    end

    it "#letter_reorder" do
      expect(@bombe.letter_reorder).to eq(["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0."])
    end

    it "#letter_join" do
      expect(@bombe.letter_join).to eq([ ["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."] ])
    end

    it "#decode" do
      expect(@bombe.decode).to eq('hello')
    end
  end
end