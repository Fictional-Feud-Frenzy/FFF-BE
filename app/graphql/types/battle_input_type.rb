module Types
  class BattleType < Types::BaseInputObject
    argument :character1Id, ID, required: true, loads: Types::CharacterType
    argument :character2Id, ID, required: true, loads: Types::CharacterType
  end
end