class Cypher
  attr_reader :input, :encrypted_message
  def initialize(input, red_fill_1, red_fill_2, red_fill_3)
    @input = input
    @simple_cypher_line_1 = red_fill_1
    @simple_cypher_line_2 = red_fill_2
    @simple_cypher_line_3 = red_fill_3
    @encrypted_message = nil
  end

  def break_down
    @input.downcase.chars
  end

  def encode_lines
    @encoded_line_1 = [ break_down.map { |character| @simple_cypher_line_1[character] }.join ]
    @encoded_line_2 = [ break_down.map { |character| @simple_cypher_line_2[character] }.join ]
    @encoded_line_3 = [ break_down.map { |character| @simple_cypher_line_3[character] }.join ]
  end

  def line_split
    encode_lines
    @encoded_arrays_1 = @encoded_line_1[0].scan(/.{1,80}/)
    @encoded_arrays_2 = @encoded_line_2[0].scan(/.{1,80}/)
    @encoded_arrays_3 = @encoded_line_3[0].scan(/.{1,80}/)
  end

  def line_end_break
    line_split
    @encoded_arrays_to_merge_1 = @encoded_arrays_1.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encoded_arrays_to_merge_2 = @encoded_arrays_2.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encoded_arrays_to_merge_3 = @encoded_arrays_3.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
  end

  def encode
    line_end_break
    @encrypted_message = @encoded_arrays_to_merge_1.zip(@encoded_arrays_to_merge_2).zip(@encoded_arrays_to_merge_3).join.chomp
  end
end