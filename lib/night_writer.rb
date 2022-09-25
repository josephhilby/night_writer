require './lib/red_fill'
require './lib/cypher'

message_file = File.open(ARGV[0], 'r')
message = message_file.read
count = message.length

r_fill = RedFill.new
cypher = Cypher.new(message, r_fill.red_fill_1, r_fill.red_fill_2, r_fill.red_fill_3)
cypher.encode

braille_file = File.open(ARGV[1], 'w')
braille_file.write(cypher.encrypted_message)
braille_file.close

puts "Created #{ARGV[1]} containing #{count} characters"