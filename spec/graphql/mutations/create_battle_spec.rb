require 'rails_helper'

RSpec.describe 'CreateBattle', type: :mutation do
  it 'creates a battle and returns the winner and description' do
    character1 = Character.create(name: 'Character 1', intelligence: 80, strength: 90, speed: 70, durability: 85, power: 75, combat: 88, power_stats_weighted_average: 99, full_name: 'Full Name 1', publisher: 'Publisher 1', alignment: 'Good', image: 'image_url_1')
    character2 = Character.create(name: 'Character 2', intelligence: 85, strength: 92, speed: 75, durability: 80, power: 78, combat: 90, power_stats_weighted_average: 69, full_name: 'Full Name 2', publisher: 'Publisher 2', alignment: 'Evil', image: 'image_url_2')
    
    mutation_string = <<~GRAPHQL
    mutation ($character1: Int!, $character2: Int!){
      createBattle(character1: $character1, character2: $character2) {
        id
        character1 {
          id
        }
        character2 {
          id
        }
        winner { 
          id
          fullName
        }
        description
      }
    }
    GRAPHQL

    response = FffBeSchema.execute(mutation_string, variables: { character1: character1.id, character2: character2.id })
    expect(response['data']['createBattle']['id']).to eq(Battle.last.id.to_s)
    expect(response['data']['createBattle']['character1']['id']).to eq(character1.id.to_s)
    expect(response['data']['createBattle']['character2']['id']).to eq(character2.id.to_s)
    expect(response['data']['createBattle']['winner']['id']).to eq(character1.id.to_s)
    expect(response['data']['createBattle']['winner']['fullName']).to eq(character1.full_name)
    expect(response['data']['createBattle']['description']).to be_a(String)
  end
end