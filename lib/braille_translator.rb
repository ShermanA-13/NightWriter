require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator < BrailleAlphabet
  attr_reader :braille_letters

  def initialize
    @english_message = nil
    super
  end
end
