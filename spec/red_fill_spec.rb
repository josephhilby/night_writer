require 'rspec'
require './lib/red_fill'

RSpec.describe RedFill do
  before(:each) do
    @r_fill = RedFill.new
  end

  context "Initilize" do
    it "#exitst" do
      expect(@r_fill).to be_a(RedFill)
    end

    it "#readable" do
      expect(@r_fill.red_fill_1['a']).to eq('0.')
      expect(@r_fill.red_fill_2['m']).to eq('..')
      expect(@r_fill.red_fill_3['k']).to eq('0.')
    end
  end
end