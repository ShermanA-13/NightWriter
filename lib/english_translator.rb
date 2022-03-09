require_relative 'dictionary'
require 'pry'

class EnglishTranslator < Dictionary
  attr_accessor :english_characters

  def initialize
    @english_characters = super.invert
  end

  def translate(input)
    input = combine_braille_lines(input.split("\n"))
    input = reformat(input)
    letters = []
    # binding.pry
    if input.all? { |input| input.instance_of?(String) }
      letters << @english_characters[input].to_s
    else
      input.each { |letter| letters << @english_characters[letter].to_s }
    end
    letters.join
  end

  def combine_braille_lines_single(input_lines)
    # binding.pry
    combined_braille = %w[$ $ $]
    i = 0
    3.times do
      combined_braille[i] = input_lines[i].chars.each_slice(2).map(&:join)
      i += 1
    end
    combined_braille.map { |line| line.join }
  end

  def combine_braile_lines_multi(input_lines)
    iteration = input_lines.count / 3
    combined_braille = %w[$ $ $]
    i = 0
    iteration.times do
      combined_braille[0] += input_lines[i]
      combined_braille[1] += input_lines[i + 1]
      combined_braille[2] += input_lines[i + 2]
      i += 3
    end
    combined_braille.map { |row| row.delete('$') }
  end

  def combine_braille_lines(input_lines)
    input_lines = input_lines
    if input_lines.count > 3
      combine_braile_lines_multi(input_lines)
    else
      combine_braille_lines_single(input_lines)
    end
  end

  def reformat(input)
    i = 0
    reformatted_braille = []
    divided_lines = input.map { |line| line.chars.each_slice(2).map(&:join) }
    until i == divided_lines[0].length
      reformatted_braille << divided_lines.map { |line| line[i] }
      i += 1
    end
    reformatted_braille
  end
end
