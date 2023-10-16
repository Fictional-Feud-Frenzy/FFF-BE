require 'rails_helper'

RSpec.describe 'Joke API' do
  describe 'GET /joke' do
    describe 'Happy Path' do
      it 'returns a random Chuck Norris joke', :vcr do
        get '/joke'

        expect(response).to be_successful
        expect(response.status).to eq(200)

        joke = JSON.parse(response.body, symbolize_names: true)
        expect(joke).to be_a String
      end
    end
  end
end