require_relative '../lib/braille_alphabet'
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
end
