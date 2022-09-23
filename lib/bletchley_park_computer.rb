require 'pry'

class BletchleyParkComputer
  attr_reader :decrypted_msg
  def initialize(incoming_msg, red_fill_1, red_fill_2, red_fill_3)
    @incoming_msg = incoming_msg
    @simple_cypher_line_1 = red_fill_1
    @simple_cypher_line_2 = red_fill_2
    @simple_cypher_line_3 = red_fill_3
    @decrypted_msg = nil
  end

  def line_split
    split_msg = @incoming_msg.split("\n")
    binding.pry
  end
end

# hello world = "O.O.O.O.O.  .OO.O.O.OO\nOO.OO.O..O  OO.OOOO..O\n....O.O.O.  .OO.O.O..."
# .scan(/.{1,80}/)