require_relative '../lib/braille_alphabet'
require_relative '../lib/braille_translator'
require 'pry'

RSpec.describe do
  context 'Iteration 2' do
    describe BrailleAlphabet do
      before(:each) do
        @br_alpha = BrailleAlphabet.new
      end

      it 'exists' do
        expect(@br_alpha).to be_a(BrailleAlphabet)
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
        # @super = BrailleAlphabet.new
        # allow(@br_translator).to receive(:english_message).and_return('yes')
        # expect(@br_translator).to receive(:super).and_return(@super)
        # binding.pry
        # expect_any_instance_of(BrailleTranslator).to receive(:english_message).and_return('yes')
        # expect_any_instance_of(@br_translator).to receive(:english_message).and_return('yes')
        # expect_any_instance_of(@br_translator).to receive(BrailleAlphabet.new)
        # @br_translator = instance_double('BrailleTranslator', english_message: 'yes')
        # binding.pry

        expected1 = "000..0\n.0.00.\n00..0."
        expected2 = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

        expect(@br_translator.render('yes')).to eq(expected1)
        expect(@br_translator.render('hello')).to eq(expected2)
      end

      xit '#cut breaks up a message anything over 40 characters' do
        message = 'the quick brown fox jumps over the lazy dog'
        expected = ['the quick brown fox jumps over the lazy ', 'dog']

        expect(@br_translator.cut(message)).to eq(expected)
      end
    end
  end
end
