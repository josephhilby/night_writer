class Cypher
  attr_reader :input, :simple_cypher
  def initialize(input)
    @input = input
    @simple_cypher_line_1 = { 'h' => "O.", ' ' => "  " }
    @simple_cypher_line_2 = { 'h' => "OO", ' ' => "  " }
    @simple_cypher_line_3 = { 'h' => "..", ' ' => "  " }
  end

  def break_down
    @input.downcase.chars
  end

  def encode
    break_down.map do |character|
      @simple_cypher_line_1[character] + "\n"
      @simple_cypher_line_1[character] + "\n"
      @simple_cypher_line_1[character] + "\n"
    end
  end
end