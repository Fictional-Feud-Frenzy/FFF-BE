# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :characters, [Types::CharacterType], null: false, description: "Get all characters"
    field :character, Types::CharacterType, null: true, description: "Get a character by ID" do
      argument :id, ID, required: true
    end

    def characters
      Character.all
    end

    def character(id:)
      Character.find_by(id: id)
    end
  end
end
