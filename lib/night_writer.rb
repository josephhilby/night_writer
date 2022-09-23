require './lib/cypher'
require './lib/formatter'

message_file = File.open(ARGV[0], 'r')
message = message_file.read
count = message.length

cypher = Cypher.new(message)
cypher.encode

formatter = Formatter.new(cypher.encoded_line_1, cypher.encoded_line_2, cypher.encoded_line_3)
formatter.merge

braille_file = File.open(ARGV[1], 'w')
braille_file.write(formatter.encrypted_message)
braille_file.close

puts "Created #{ARGV[1]} containing #{count} characters"