require './lib/black_fill'
require './lib/bletchley_park_computer'

message_file = File.open(ARGV[0], 'r')
message = message_file.read

b_fill = BlackFill.new
bombe = BletchleyParkComputer.new(message, b_fill.black_fill)
decoded_msg = bombe.letter_decode

braille_file = File.open(ARGV[1], 'w')
count = decoded_msg.length
braille_file.write(decoded_msg)
braille_file.close

puts "Created #{ARGV[1]} containing #{count} characters"