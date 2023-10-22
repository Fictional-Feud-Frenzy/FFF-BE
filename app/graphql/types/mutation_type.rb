# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_battle, mutation: Mutations::CreateBattle
  end
end
