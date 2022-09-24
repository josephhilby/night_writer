class BletchleyParkComputer
  attr_reader :decrypted_msg
  def initialize(incoming_msg, black_fill)
    @incoming_msg = incoming_msg
    @simple_cypher = black_fill
    @decrypted_msg = nil
  end

  def file_split
    @incoming_msg.split("\n")
  end

  def line_parts_join
    file_split.each_slice(3).to_a
  end

  def letter_split
    line_parts_join.map { |line| line.map { |line_fragment| line_fragment.scan(/.{1,2}/) } }
  end

  def letter_reorder
    ordered_letters = []
    letter_split.each do |line|
        ordered_letters << [line[0].zip(line[1]).zip(line[2])]
    end
    ordered_letters.flatten
  end

  def letter_join
    letter_reorder.each_slice(3).to_a
  end

  def letter_decode
    @decrypted_msg = letter_join.map { |encoded_ltr| @simple_cypher.key(encoded_ltr) }.join
  end
end