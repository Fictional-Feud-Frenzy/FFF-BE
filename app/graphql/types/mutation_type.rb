# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_character, mutation: Mutations::CreateCharacter
  end
end
