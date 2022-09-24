require 'rspec'
require './lib/black_fill'
require './lib/formatter'
require './lib/bletchley_park_computer'

RSpec.describe BletchleyParkComputer do
  before(:each) do
    b_fill = BlackFill.new
    formatter = Formatter.new(["O.O.O.O.O."],
                              ["OO.OO.O..O"],
                              ["....O.O.O."])
    allow(b_fill).to receive(:black_fill).and_return({ 'e' => ['O.', '.O', '..'],
                                                       'h' => ["O.", "OO", ".."],
                                                       'l' => ['O.', 'O.', 'O.'],
                                                       'o' => ['O.', '.O', 'O.'] })
    allow(formatter).to receive(:encrypted_message).and_return("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.")
    incoming_msg = formatter.encrypted_message
    @bombe = BletchleyParkComputer.new(incoming_msg, b_fill.black_fill)
  end

  context "Initilize" do
    it "#exitst" do
      expect(@bombe).to be_a(BletchleyParkComputer)
    end

    it "#readable" do
      expect(@bombe.decrypted_msg).to eq(nil)
    end
  end

  context "Methods" do
    it "#file_split" do
      expect(@bombe.file_split).to eq(["O.O.O.O.O.", "OO.OO.O..O", "....O.O.O."])
    end

    it "#line_join" do
      expect(@bombe.line_parts_join).to eq([ ["O.O.O.O.O.", "OO.OO.O..O", "....O.O.O."] ])
    end

    it "#letter_split" do
      expect(@bombe.letter_split).to eq([ [ ["O.", "O.", "O.", "O.", "O."], ["OO", ".O", "O.", "O.", ".O"], ["..", "..", "O.", "O.", "O."] ] ])
    end

    it "#letter_reorder" do
      expect(@bombe.letter_reorder).to eq(["O.", "OO", "..", "O.", ".O", "..", "O.", "O.", "O.", "O.", "O.", "O.", "O.", ".O", "O."])
    end

    it "#letter_decode" do
      @bombe.letter_decode
      expect(@bombe.decrypted_msg).to eq('hello')
    end
  end
end