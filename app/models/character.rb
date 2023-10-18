class Character < ApplicationRecord
  attr_accessor :name,
                :full_name,
                :intelligence,
                :strength,
                :speed,
                :durability,
                :power,
                :combat,
                :place_of_birth,
                :publisher,
                :alignment,
                :gender,
                :race,
                :height,
                :weight,
                :eye_color,
                :hair_color,
                :group_affiliation,
                :image,
                :power_stats_weighted_average

                validates :intelligence, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }
                validates :strength, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }
                validates :speed, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }
                validates :durability, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }
                validates :power, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }
                validates :combat, presence: true, format: { with: /\A[^nN]+[^uU]+[^lL]+[^lL]+\z/ }

  def initialize(data)
    @name = data['name']
    @full_name = data['biography']['full-name']
    @intelligence = data['powerstats']['intelligence']
    @strength = data['powerstats']['strength']
    @speed = data['powerstats']['speed']
    @durability = data['powerstats']['durability']
    @power = data['powerstats']['power']
    @combat = data['powerstats']['combat']
    @place_of_birth = data['biography']['place-of-birth']
    @publisher = data['biography']['publisher']
    @alignment = data['biography']['alignment']
    @gender = data['appearance']['gender']
    @race = data['appearance']['race']
    @height = data['appearance']['height'][0]
    @weight = data['appearance']['weight'][0]
    @eye_color = data['appearance']['eye-color']
    @hair_color = data['appearance']['hair-color']
    @group_affiliation = data['connections']['group-affiliation']
    @image = data['image']['url']
    @power_stats_weighted_average = adj_intelligence + adj_strength + adj_speed + adj_power + adj_durability + adj_combat
  end

  def adj_intelligence
    @intelligence.to_f * 0.10
  end

  def adj_speed
    @speed.to_f * 0.20
  end

  def adj_strength
    @strength.to_f * 0.15
  end

  def adj_power
    @power.to_f * 0.15
  end

  def adj_durability
    @durability.to_f * 0.20
  end

  def adj_combat
    @combat.to_f * 0.20
  end
end