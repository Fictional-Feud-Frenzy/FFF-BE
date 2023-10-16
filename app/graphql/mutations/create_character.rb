# class Mutation::CreateCharacter < Mutations::BaseMutation
#   argument :name, String, required: true
#   argument :intelligence, Integer, required: true
#   argument :strength, Integer, required: true
#   argument :speed, Integer, required: true
#   argument :durability, Integer, required: true
#   argument :power, Integer, required: true
#   argument :combat, Integer, required: true
#   argument :full_name, String, required: false
#   argument :place_of_birth, String, required: false
#   argument :publisher, String, required: false
#   argument :alignment, String, required: false
#   argument :gender, String, required: false
#   argument :race, String, required: false
#   argument :height, String, required: false
#   argument :weight, String, required: false
#   argument :eye_color, String, required: false
#   argument :hair_color, String, required: false
#   argument :group_affiliation, String, required: false
#   argument :image, String, required: false

#   field :character, Types::CharacterType, null: false 
#   field :errors, [String], null: false

#   def resolve(name:, intelligence:, strength:, speed:, durability:, power:, combat:)
#     character = Character.new(name: name, intelligence: intelligence, strength: strength, speed: speed, durability: durability, power: power, combat: combat)
  
#     if character.save
#       {
#         character: character,
#         errors: []
#       }
#     else
#       {
#         character: nil,
#         errors: character.errors.full_messages
#       }
#     end
  
#   end
# end