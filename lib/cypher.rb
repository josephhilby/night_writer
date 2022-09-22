require 'pry'

class Cypher
  attr_reader :input, :simple_cypher_line_1, :simple_cypher_line_2, :simple_cypher_line_3
  def initialize(input)
    @input = input
    @simple_cypher_line_1 = { 'h' => "O.", ' ' => "  " }
    @simple_cypher_line_2 = { 'h' => "OO", ' ' => "  " }
    @simple_cypher_line_3 = { 'h' => "..", ' ' => "  " }
  end

  def break_down
    @input.downcase.chars
  end

  def line_break(message)

  end

  def encode
    encoded = []
    break_down.each { |character| encoded << @simple_cypher_line_1[character] }
    encoded << "\n"
    break_down.each { |character| encoded << @simple_cypher_line_2[character] }
    encoded << "\n"
    break_down.each { |character| encoded << @simple_cypher_line_3[character] }
    encoded
  end
end