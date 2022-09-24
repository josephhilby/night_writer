class Cypher
  attr_reader :input, :encoded_line_1, :encoded_line_2, :encoded_line_3
  def initialize(input, red_fill_1, red_fill_2, red_fill_3)
    @input = input
    @simple_cypher_line_1 = red_fill_1
    @simple_cypher_line_2 = red_fill_2
    @simple_cypher_line_3 = red_fill_3
    @encoded_line_1 = nil
    @encoded_line_2 = nil
    @encoded_line_3 = nil
  end

  def break_down
    @input.downcase.chars
  end

  def encode
    @encoded_line_1 = [break_down.map { |character| @simple_cypher_line_1[character] }.join]
    @encoded_line_2 = [break_down.map { |character| @simple_cypher_line_2[character] }.join]
    @encoded_line_3 = [break_down.map { |character| @simple_cypher_line_3[character] }.join]
  end
end