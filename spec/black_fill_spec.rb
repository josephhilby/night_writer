require 'rspec'
require './lib/black_fill'

RSpec.describe BlackFill do
  before(:each) do
    @b_fill = BlackFill.new
  end

  context "Initilize" do
    it "#exitst" do
      expect(@b_fill).to be_a(BlackFill)
    end

    it "#readable" do
      expect(@b_fill.black_fill['h']).to eq(["O.", "OO", ".."])
    end
  end
end