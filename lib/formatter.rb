class Formatter
  attr_reader :encrypted_message
  def initialize(encrypted_line_1, encrypted_line_2, encrypted_line_3)
    @encrypted_line_1 = encrypted_line_1
    @encrypted_line_2 = encrypted_line_2
    @encrypted_line_3 = encrypted_line_3
    @encrypted_message = nil
  end

  def line_split
    @encrypted_arrays_1 = @encrypted_line_1[0].scan(/.{1,80}/)
    @encrypted_arrays_2 = @encrypted_line_2[0].scan(/.{1,80}/)
    @encrypted_arrays_3 = @encrypted_line_3[0].scan(/.{1,80}/)
  end

  def line_break
    line_split
    @encrypted_arrays_to_merge_1 = @encrypted_arrays_1.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encrypted_arrays_to_merge_2 = @encrypted_arrays_2.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
    @encrypted_arrays_to_merge_3 = @encrypted_arrays_3.map { |sub_array| if !sub_array.end_with?("\n") then sub_array.insert(-1, "\n") end }
  end

  def merge
    line_break
    @encrypted_message = @encrypted_arrays_to_merge_1.zip(@encrypted_arrays_to_merge_2).zip(@encrypted_arrays_to_merge_3).join.chomp
  end
end