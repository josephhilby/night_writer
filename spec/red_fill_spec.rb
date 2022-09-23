require 'pry'

require 'rspec'
require './lib/red_fill'

RSpec.describe RedFill do
  before(:each) do
    @fill = RedFill.new
  end

  context "Initilize" do
    it "#exitst" do
      expect(@fill).to be_a(RedFill)
    end

    it "#readable" do
      expect(@fill.red_fill_1['a']).to eq('O.')
      expect(@fill.red_fill_2['m']).to eq('..')
      expect(@fill.red_fill_3['k']).to eq('O.')
    end
  end
end