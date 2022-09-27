require './lib/simple_key_loader'

class Cypher
  include SimpleKeyLoader
  def initialize(input)
    @input = input
  end

  def input_msg_to_chars
    @input.downcase.chars
  end

  def encode_line_parts
    @encoded_line_1 = [ input_msg_to_chars.map { |character| @simple_cypher_line_1[character] }.join ]
    @encoded_line_2 = [ input_msg_to_chars.map { |character| @simple_cypher_line_2[character] }.join ]
    @encoded_line_3 = [ input_msg_to_chars.map { |character| @simple_cypher_line_3[character] }.join ]
  end

  def line_wrap
    encode_line_parts
    @encoded_arrays_1 = @encoded_line_1[0].scan(/.{1,80}/)
    @encoded_arrays_2 = @encoded_line_2[0].scan(/.{1,80}/)
    @encoded_arrays_3 = @encoded_line_3[0].scan(/.{1,80}/)
  end

  def new_line_at_line_part_end
    line_wrap
    @encoded_arrays_to_merge_1 = @encoded_arrays_1.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encoded_arrays_to_merge_2 = @encoded_arrays_2.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encoded_arrays_to_merge_3 = @encoded_arrays_3.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
  end

  def encode
    new_line_at_line_part_end
    @encrypted_message = @encoded_arrays_to_merge_1.zip(@encoded_arrays_to_merge_2).zip(@encoded_arrays_to_merge_3).join.chomp
  end
end