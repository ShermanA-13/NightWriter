require_relative '../lib/dictionary'
require_relative '../lib/braille_translator'
require_relative '../lib/english_translator'
require 'pry'

RSpec.describe do
  context 'Iteration 2' do
    describe Dictionary do
      before(:each) do
        @br_alpha = Dictionary.new
      end

      it 'exists' do
        expect(@br_alpha).to be_a(Dictionary)
      end

      it 'has attributes' do
        expect(@br_alpha.braille_letters).to be_a(Hash)
        expect(@br_alpha.braille_letters['a']).to eq(['0.', '..', '..'])
        expect(@br_alpha.braille_letters[' ']).to eq(['..', '..', '..'])
      end
    end
  end

  context 'Iteration 2' do
    describe BrailleTranslator do
      before(:each) do
        @br_translator = BrailleTranslator.new
      end

      it 'exists' do
        expect(@br_translator).to be_a(BrailleTranslator)
      end

      it 'has attributes' do
        expect(@br_translator.braille_letters).to be_a(Hash)
        expect(@br_translator.braille_letters.length).to eq(27)
        expect(@br_translator.braille_letters['a']).to eq(['0.', '..', '..'])
        expect(@br_translator.braille_letters[' ']).to eq(['..', '..', '..'])
      end

      it '#render transforms english message braille message' do
        # @br_translator = double('BrailleTranslator')
        # @super = Dictionary.new
        # allow(@br_translator).to receive(:english_message).and_return('yes')
        # expect(@br_translator).to receive(:super).and_return(@super)
        # binding.pry
        # expect_any_instance_of(BrailleTranslator).to receive(:english_message).and_return('yes')
        # expect_any_instance_of(@br_translator).to receive(:english_message).and_return('yes')
        # expect_any_instance_of(@br_translator).to receive(Dictionary.new)
        # @br_translator = instance_double('BrailleTranslator', english_message: 'yes')
        # binding.pry

        expected1 = [
          ['00', '.0', '00'],
          ['0.', '.0', '..'],
          ['.0', '0.', '0.']
        ]
        expected2 = [
          ['0.', '00', '..'],
          ['0.', '.0', '..'],
          ['0.', '0.', '0.'],
          ['0.', '0.', '0.'],
          ['0.', '.0', '0.']
        ]

        expect(@br_translator.translate('yes')).to eq(expected1)
        expect(@br_translator.translate('hello')).to eq(expected2)
      end

      it '#cut breaks up a message anything over 40 characters' do
        message = 'the quick brown fox jumps over the lazy dog'
        expected = ".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..\n0000.0..00..0.........0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000..\n000.00\n.0.000\n..0...\n"

        expect(@br_translator.render(message)).to eq(expected)
      end
    end
  end

  context 'Iteration 3' do
    describe EnglishTranslator do
      before(:each) do
        @eng_translator = EnglishTranslator.new
      end

      it 'exists' do
        expect(@eng_translator).to be_a(EnglishTranslator)
      end

      it 'knows to invert braille dictionary to english characters' do
        expect(@eng_translator.english_characters).to eq(@eng_translator.braille_letters.invert)
      end

      it 'able to translate braille to eng_char' do
        x = ['00', '..', '00']

        expect(@eng_translator.translate(x)).to eq('x')
      end

      it '#translate can translate words' do
        hello = @eng_translator.translate([['0.', '00', '..'],
                                           ['0.', '.0', '..'],
                                           ['0.', '0.', '0.'],
                                           ['0.', '0.', '0.'],
                                           ['0.', '.0', '0.']])

        expect(hello).to eq 'hello'
      end
    end
  end
end
