require './lib/simple_key_loader'

class BletchleyParkComputer
  include SimpleKeyLoader
  def initialize(incoming_msg)
    @incoming_msg = incoming_msg
  end

  def file_split_by_line
    @incoming_msg.split("\n")
  end

  def line_parts_join
    file_split_by_line.each_slice(3).to_a
  end

  def letter_split
    line_parts_join.map { |line| line.map { |line_fragment| line_fragment.scan(/.{1,2}/) } }
  end

  def letter_reorder
    ordered_letters = []
    letter_split.each { |line| ordered_letters << [ line[0].zip(line[1]).zip(line[2]) ] }
    ordered_letters.flatten
  end

  def letter_join
    letter_reorder.each_slice(3).to_a
  end

  def decode
    letter_join.map { |encoded_ltr| @simple_cypher.key(encoded_ltr) }.join
  end
end