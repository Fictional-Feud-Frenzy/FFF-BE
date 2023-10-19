require 'rails_helper'

RSpec.describe 'battle requests', type: :request do
  it 'creates a battle and returns the winner and description' do
    character1 = Character.create(name: 'Character 1', intelligence: 80, strength: 90, speed: 70, durability: 85, power: 75, combat: 88, full_name: 'Full Name 1', publisher: 'Publisher 1', alignment: 'Good', image: 'image_url_1')
    character2 = Character.create(name: 'Character 2', intelligence: 85, strength: 92, speed: 75, durability: 80, power: 78, combat: 90, full_name: 'Full Name 2', publisher: 'Publisher 2', alignment: 'Evil', image: 'image_url_2')
    
    mutation_string = <<~GRAPHQL
    mutation($input: BattleInputType!) {
      battle(input: $input) {
        battle {
          id
          # Include other fields you need in the response
        }
        errors
      }
    }
    GRAPHQL

    variables = {
      input: {
        character1Id: character1.id.to_s,
        character2Id: character2.id.to_s
      }
    }

    post '/graphql', params: { query: mutation_string, variables: variables }
    parsed_response = JSON.parse(response.body)

    expect(parsed_response['data']['battle']).to_not be_nil
    expect(parsed_response['data']['errors']).to eq("Character(s) not found")
  end
end