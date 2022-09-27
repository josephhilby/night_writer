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
    it "#input_msg_to_chars" do
      expect(@cypher.input_msg_to_chars).to eq(['h', 'h', ' '])
    end

    it "#encode_line_parts" do
      expect(@cypher.encode_line_parts).to eq(["......"])
    end

    it "#line_wrap" do
      expect(@cypher.line_wrap).to eq(["......"])
    end

    it "#new_line_at_line_part_end" do
      expect(@cypher.new_line_at_line_part_end).to eq(["......\n"])
    end

    it "#encode" do
      @cypher.encode
      expect(@cypher.encrypted_message).to eq("0.0...\n0000..\n......")
    end
  end
end