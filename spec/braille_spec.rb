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
        expect(@br_alpha.braille_letters[:a]).to eq(['0.', '..', '..'])
        expect(@br_alpha.braille_letters[:" "]).to eq(['..', '..', '..'])
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
        expect(@br_translator.braille_letters[:a]).to eq(['0.', '..', '..'])
        expect(@br_translator.braille_letters[:" "]).to eq(['..', '..', '..'])
      end
    end
  end
end
