require 'rails_helper'

RSpec.describe NorrisService do
  describe '#random_joke' do
    it 'returns a random Chuck Norris joke', :vcr do
      jokes = NorrisService.random_joke

      expect(jokes).to be_a(Hash)
      expect(jokes).to have_key(:total)
      expect(jokes[:total]).to be_an(Integer)
      expect(jokes).to have_key(:result)
      expect(jokes[:result]).to be_an(Array)
      
      jokes[:result].each do |joke|
        expect(joke).to have_key(:id)
        expect(joke[:id]).to be_a(String)
        expect(joke).to have_key(:value)
        expect(joke[:value]).to be_a(String)
      end
    end
  end
end