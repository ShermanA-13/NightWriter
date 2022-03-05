english_reader = File.open(ARGV[0], 'r')
english_message = english_reader.read
english_reader.close

braille_message = english_message.downcase
braille_writer = File.open(ARGV[1], 'w')
braille_writer.write(braille_message)

puts "Created 'braille.txt' containing #{braille_message.length} characters"
