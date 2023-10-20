# frozen_string_literal: true

module Mutations
  class CreateBattle < BaseMutation
    null true
    argument :character1, Int
    argument :character2, Int

    type Types::BattleType

    def resolve(character1:, character2:)
      character1 = Character.find_by(id: character1)
      character2 = Character.find_by(id: character2)

      if character1.power_stats_weighted_average == character2.power_stats_weighted_average
        winner = Character.find_by(id: 176)
        description = ChatService.new(character1.name, character2.name, mode: :norris).getstory(character1.name, character2.name, mode: :norris)
      elsif character1.power_stats_weighted_average > character2.power_stats_weighted_average
        winner = character1
        description = ChatService.new(character1.name, character2.name).get_story
      else
        winner = character2
        description = ChatService.new(character2.name, character1.name).get_story
      end

      if character1 && character2
        battle = Battle.create(character1: character1, character2: character2, winner: winner, description: description)
        battle
      else
        {  errors: ["Character(s) not found"] }
      end
    end
  end
end