require 'pry'

class Cypher
  attr_reader :input, :encoded_line_1, :encoded_line_2, :encoded_line_3
  def initialize(input)
    @input = input
    @simple_cypher_line_1 = { 'h' => "O.", ' ' => "  " }
    @simple_cypher_line_2 = { 'h' => "OO", ' ' => "  " }
    @simple_cypher_line_3 = { 'h' => "..", ' ' => "  " }
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