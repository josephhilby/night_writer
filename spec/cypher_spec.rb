require 'rspec'
require './lib/red_fill'
require './lib/cypher'

RSpec.describe Cypher do
  before(:each) do
    r_fill = RedFill.new
    allow(r_fill).to receive(:red_fill_1).and_return({ 'h' => '0.',
                                                       ' ' => '..' })
    allow(r_fill).to receive(:red_fill_2).and_return({ 'h' => '00',
                                                       ' ' => '..' })
    allow(r_fill).to receive(:red_fill_3).and_return({ 'h' => '..',
                                                       ' ' => '..' })
    @cypher = Cypher.new('Hh ', r_fill.red_fill_1, r_fill.red_fill_2, r_fill.red_fill_3)
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