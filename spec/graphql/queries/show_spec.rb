require 'rails_helper'

RSpec.describe 'show character query', type: :request do
  it 'returns one character with all data' do
    character = Character.create!(name: 'Character 1', intelligence: 80, strength: 90, speed: 70, durability: 85, power: 75, combat: 88, full_name: 'Full Name 1', place_of_birth: 'moon', publisher: 'Publisher 1', alignment: 'Good', gender: 'male', race: 'white', height: "4'3", weight: '105', eye_color: 'blue', hair_color: 'brown', group_affiliation: 'cool guys', image: 'image_url_1', power_stats_weighted_average: 80)

    query_string = <<-GRAPHQL
      query Character($id: ID!) {
        character (id: $id) {
          id
          name
          intelligence
          strength
          speed
          durability
          power
          combat
          fullName
          placeOfBirth
          publisher
          alignment
          gender
          race
          height
          weight
          eyeColor
          hairColor
          groupAffiliation
          image
          powerStatsWeightedAverage
        }
      }
    GRAPHQL
      
    post '/graphql', params: { query: query_string, variables: { id: character.id } }
    json_response = JSON.parse(response.body)
    data = json_response['data']['character']

    expect(data['id']).to eq(character.id.to_s)
    expect(data['name']).to eq(character.name)
    expect(data['intelligence']).to eq(character.intelligence)
    expect(data['strength']).to eq(character.strength)
    expect(data['speed']).to eq(character.speed)
    expect(data['durability']).to eq(character.durability)
    expect(data['power']).to eq(character.power)
    expect(data['combat']).to eq(character.combat)
    expect(data['fullName']).to eq(character.full_name)
    expect(data['placeOfBirth']).to eq(character.place_of_birth)
    expect(data['publisher']).to eq(character.publisher)
    expect(data['alignment']).to eq(character.alignment)
    expect(data['gender']).to eq(character.gender)
    expect(data['race']).to eq(character.race)
    expect(data['height']).to eq(character.height)
    expect(data['weight']).to eq(character.weight)
    expect(data['eyeColor']).to eq(character.eye_color)
    expect(data['hairColor']).to eq(character.hair_color)
    expect(data['groupAffiliation']).to eq(character.group_affiliation)
    expect(data['image']).to eq(character.image)
    expect(data['powerStatsWeightedAverage']).to eq(character.power_stats_weighted_average)
  end
end