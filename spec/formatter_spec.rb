require 'rspec'
require './lib/red_fill'
require './lib/cypher'
require './lib/formatter'

RSpec.describe Formatter do
  before(:each) do
    @formatter = Formatter.new(["0.0..."], ["0000.."], ["......"])
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
      expect(@formatter.line_split).to eq(["......"])
    end

    it "#line_break" do
      expect(@formatter.line_end_break).to eq(["......\n"])
    end

    it "#merge" do
      @formatter.merge
      expect(@formatter.encrypted_message).to eq("0.0...\n0000..\n......")
    end
  end
end