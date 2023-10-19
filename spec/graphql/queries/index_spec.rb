# spec/queries/get_characters_query_spec.rb
require 'rails_helper'

RSpec.describe 'characters query', type: :request do
  it 'returns all characters with minimal data' do
    # Manually create characters
    characters = [
      Character.create(name: 'Character 1', intelligence: 80, strength: 90, speed: 70, durability: 85, power: 75, combat: 88, full_name: 'Full Name 1', publisher: 'Publisher 1', alignment: 'Good', image: 'image_url_1'),
      Character.create(name: 'Character 2', intelligence: 85, strength: 92, speed: 75, durability: 80, power: 78, combat: 90, full_name: 'Full Name 2', publisher: 'Publisher 2', alignment: 'Evil', image: 'image_url_2'),
      Character.create(name: 'Character 3', intelligence: 88, strength: 87, speed: 78, durability: 89, power: 82, combat: 85, full_name: 'Full Name 3', publisher: 'Publisher 1', alignment: 'Neutral', image: 'image_url_3')
    ]

    query_string = <<-GRAPHQL
      query {
        characters {
          id
          name
          intelligence
          strength
          speed
          durability
          power
          combat
          fullName
          publisher
          alignment
          image
        }
      }
    GRAPHQL

    post '/graphql', params: { query: query_string }
    json_response = JSON.parse(response.body)
    data = json_response['data']['characters']

    expect(data.count).to eq(3)
    expect(data.map { |character| character['id'] }).to match_array(characters.map(&:id).map(&:to_s))
    expect(data.map { |character| character['name'] }).to match_array(characters.map(&:name))
    expect(data.map { |character| character['intelligence'] }).to match_array(characters.map(&:intelligence))
    expect(data.map { |character| character['fullName'] }).to match_array(characters.map(&:full_name))
  end
end
