require_relative '../lib/english_translator'

braille_reader = File.open(ARGV[0], 'r')
braille_message = braille_reader.read.chomp
braille_reader.close

eng_translator = EnglishTranslator.new
english_message = eng_translator.translate(braille_message.downcase)
english_writer = File.open(ARGV[1], 'w')
english_writer.write(english_message)

puts "Created 'message.txt' containing #{english_message.length} characters"
