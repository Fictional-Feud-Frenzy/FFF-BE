class Battle < ApplicationRecord
  belongs_to :character1, class_name: 'Character', foreign_key: 'character1_id'
  belongs_to :character2, class_name: 'Character', foreign_key: 'character2_id'
  belongs_to :winner, class_name: 'Character', foreign_key: 'winner_id', optional: true
  
  validates_presence_of :character1, :character2, :winner, :description

end