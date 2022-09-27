require './lib/cypher'

message_file = File.open(ARGV[0], 'r')
message = message_file.read

cypher = Cypher.new(message)
cypher.red_fill
encoded_msg = cypher.encode

braille_file = File.open(ARGV[1], 'w')
braille_file.write(encoded_msg)
braille_file.close
count = message.length

puts "Created #{ARGV[1]} containing #{count} characters"