require './lib/bletchley_park_computer'

braille_file = File.open(ARGV[0], 'r')
message = braille_file.read

bombe = BletchleyParkComputer.new(message)
bombe.black_fill
decoded_msg = bombe.decode

message_file = File.open(ARGV[1], 'w')
message_file.write(decoded_msg)
message_file.close
count = decoded_msg.length

puts "Created #{ARGV[1]} containing #{count} characters"