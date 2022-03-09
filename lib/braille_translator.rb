require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator < BrailleAlphabet
  attr_reader :braille_letters

  def initialize
    super
    binding.pry
  end

  def translate(input)
    letters = input.split('')
    letters.map { |letter| @braille_letters[letter] }
  end

  def render(english_message)
    rows = []
    braille_message = translate(english_message)
    rows [0] = braille_message.flat_map { |letter|  letter[0] }.join
    rows [1] = braille_message.flat_map { |letter|  letter[1] }.join
    rows [2] = braille_message.flat_map { |letter|  letter[2] }.join
    cut_message = cut(rows)
    reformat(cut_message)
  end

  def cut(message)
    if message[0].length > 80
      message.map { |message| message.chars.each_slice(80).map(&:join) }
    else
      message
    end
  end

  def reformat(cut_message)
    if cut_message.flatten.count > 3
      count = cut_message[0].length
      i = 0
      formated_msg = ''
      until i > (count - 1)
        cut_message.map { |line| formated_msg += line[i] + "\n" }
        i += 1
      end
      formated_msg
    else
      cut_message.join("\n")
    end
  end
end
