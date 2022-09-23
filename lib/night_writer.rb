require './lib/cypher'
# require './lib/formatter'

message_file = File.open(ARGV[0], 'r')
message = message_file.read
count = message.length

cypher = Cypher.new(message)
cyphered_msg = cypher.encode

braille_file = File.open(ARGV[1], 'w')
braille_file.write(cyphered_msg)
braille_file.close

puts "Created #{ARGV[1]} containing #{count} characters"