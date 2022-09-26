require 'rspec'
require './lib/simple_key_loader'
require './lib/cypher'

RSpec.describe Cypher do
  before(:each) do
    @cypher = Cypher.new('Hh ')
    @cypher.red_fill
  end

  context "Initilize" do
    it "#exitst" do
      expect(@cypher).to be_a(Cypher)
    end

    it "#readable" do
      expect(@cypher.input).to be_a(String)
      expect(@cypher.encrypted_message).to eq(nil)
    end
  end

  context "Methods" do
    it "#break_down" do
      expect(@cypher.break_down).to eq(['h', 'h', ' '])
    end

    it "#encode_lines" do
      expect(@cypher.encode_lines).to eq(["......"])
    end

    it "#line_split" do
      expect(@cypher.line_split).to eq(["......"])
    end

    it "#line_end_break" do
      expect(@cypher.line_end_break).to eq(["......\n"])
    end

    it "#encode" do
      @cypher.encode
      expect(@cypher.encrypted_message).to eq("0.0...\n0000..\n......")
    end
  end
end