require './lib/cypher'

message_file = File.open(ARGV[0], 'r')
message = message_file.read
count = message.length

cypher = Cypher.new(message)
cypher.red_fill
cypher.encode

braille_file = File.open(ARGV[1], 'w')
braille_file.write(cypher.encrypted_message)
braille_file.close

puts "Created #{ARGV[1]} containing #{count} characters"