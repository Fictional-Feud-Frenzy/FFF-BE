# frozen_string_literal: true

module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :intelligence, Integer
    field :strength, Integer
    field :speed, Integer
    field :durability, Integer
    field :power, Integer
    field :combat, Integer
    field :full_name, String
    field :place_of_birth, String
    field :publisher, String
    field :alignment, String
    field :gender, String
    field :race, String
    field :height, String
    field :weight, String
    field :eye_color, String
    field :hair_color, String
    field :group_affiliation, String
    field :image, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
