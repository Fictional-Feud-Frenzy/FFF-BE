# frozen_string_literal: true

module Mutations
  class BattleMutation < BaseMutation

    argument :character1, Types::CharacterType, required: true

    field :battle, Types::BattleType, null: true
    field :errors, [String], null: true

    def resolve(input:)
      character1 = input.character1
      character2 = input.character2

      winner = character1
      description = 'character 1 wins'

      if character1 && character2
        battle = Battle.create(character1: character1, character2: character2, winner: winner, description: description)
        battle
      else
        {  errors: ["Character(s) not found"] }
      end
    end
  end
end