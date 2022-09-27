require 'rspec'
require './lib/simple_key_loader'
require './lib/cypher'
require './lib/bletchley_park_computer'

RSpec.describe SimpleKeyLoader do

  let(:cypher) { Cypher.new('hello') {include SimpleKeyLoader} }
  let(:bletchley_park_computer) { BletchleyParkComputer.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.") {include SimpleKeyLoader} }

  context 'Methods' do
    it "#red_fill" do
      cypher.red_fill
      expect(cypher.encode).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end

    it "#black_fll" do
      bletchley_park_computer.black_fill
      expect(bletchley_park_computer.decode).to eq('hello')
    end
  end
end