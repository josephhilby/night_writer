require 'pry'

require 'rspec'
require './lib/red_fill'
require './lib/cypher'
require './lib/formatter'
require './lib/bletchley_park_computer'

RSpec.describe BletchleyParkComputer do
  before(:each) do
    r_fill = RedFill.new
    b_fill = BlackFill.new
    @cypher = Cypher.new('Hello', r_fill.red_fill_1, r_fill.red_fill_2, r_fill.red_fill_3)
    @cypher.encode

    @formatter = Formatter.new(@cypher.encoded_line_1,
                               @cypher.encoded_line_2,
                               @cypher.encoded_line_3)
    @formatter.merge
    incoming_msg = @formatter.encrypted_message

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
      # expect(@bombe.line_split).to eq([["O.", "OO", ".."]])
      # expect(@bombe.line_split).to eq([[["O.", "OO", ".."], ["O.", "OO", ".."], ["O.", "OO", ".."]]])
      expect(@bombe.file_split).to eq(["O.O.O.O.O.", "OO.OO.O..O", "....O.O.O."])
      # expect(@bombe.line_split).to eq([["O.O.O.O.O.  .OO.O.O.OO", "OO.OO.O..O  OO.OOOO..O", "....O.O.O.  .OO.O.O..."]])

      # [file[line_1.split("\n")[line_1.1],
      #                         [line_1.2],
      #                         [line_1.3]],
      #      [line_2            [line_2.1],
      #                         [line_2.2],
      #                         [line_2.3]]
      # ]
    end

    it "#line_join" do
      expect(@bombe.line_parts_join).to eq([["O.O.O.O.O.", "OO.OO.O..O", "....O.O.O."]])
    end

    it "#letter_split" do
      expect(@bombe.letter_split).to eq([[["O.", "O.", "O.", "O.", "O."], ["OO", ".O", "O.", "O.", ".O"], ["..", "..", "O.", "O.", "O."]]])
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