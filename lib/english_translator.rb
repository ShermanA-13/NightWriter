require_relative 'dictionary'
require 'pry'

class EnglishTranslator < Dictionary
  attr_reader :english_characters

  initialize
    super
    english_characters
  end
end
