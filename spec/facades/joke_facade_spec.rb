require 'rails_helper'

RSpec.describe JokeFacade do
  describe '#joke' do
    it 'returns a random Chuck Norris joke as a string', :vcr do
      joke = JokeFacade.joke

      expect(joke).to be_a(String)
    end
  end
end