require_relative 'dictionary'
require 'pry'

class EnglishTranslator < Dictionary
  attr_accessor :english_characters

  def initialize
    @english_characters = super.invert
  end
end
