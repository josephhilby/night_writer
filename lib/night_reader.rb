require './lib/bletchley_park_computer'

message_file = File.open(ARGV[0], 'r')
message = message_file.read

bombe = BletchleyParkComputer.new(message)
bombe.black_fill
decoded_msg = bombe.decode

braille_file = File.open(ARGV[1], 'w')
braille_file.write(decoded_msg)
braille_file.close
count = decoded_msg.length

puts "Created #{ARGV[1]} containing #{count} characters"