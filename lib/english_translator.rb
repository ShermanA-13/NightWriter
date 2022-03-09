require_relative 'dictionary'
require 'pry'

class EnglishTranslator < Dictionary
  attr_accessor :english_characters

  def initialize
    @english_characters = super.invert
  end

  def translate(input)
    letters = []
    if input.all? { |input| input.instance_of?(String) }
      letters << @english_characters[input].to_s
    else
      input.each { |letter| letters << @english_characters[letter].to_s }
    end
    letters.join
  end
end
