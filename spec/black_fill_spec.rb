require 'rspec'
require './lib/black_fill'

RSpec.describe BlackFill do
  before(:each) do
    @fill = BlackFill.new
  end

  context "Initilize" do
    it "#exitst" do
      expect(@fill).to be_a(BlackFill)
    end

    it "#readable" do
      expect(@fill.black_fill['h']).to eq(["O.", "OO", ".."])
    end
  end
end