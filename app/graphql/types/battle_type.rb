# frozen_string_literal: true

module Types
  class BattleType < Types::BaseObject
    description "A battle between characters"
    
    field :id, ID, null: false
    field :character1, Types::CharacterType, null: false
    field :character2, Types::CharacterType, null: false
    field :winner, Types::CharacterType
    field :description, String
  end
end