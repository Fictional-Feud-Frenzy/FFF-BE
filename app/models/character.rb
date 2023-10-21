class Character < ApplicationRecord
  validates :name, presence: true
  validates :intelligence, presence: true
  validates :strength, presence: true
  validates :speed, presence: true
  validates :durability, presence: true
  validates :power, presence: true
  validates :combat, presence: true

  def powerstats_null(data)
    all_powerstats = [data['powerstats']['intelligence'],
                      data['powerstats']['strength'],
                      data['powerstats']['speed'],
                      data['powerstats']['durability'],
                      data['powerstats']['power'],
                      data['powerstats']['combat']]
    if all_powerstats.include?("null") || all_powerstats.include?("")
      true
    else
      false
    end
  end

  def calculate_weighted_average(data)
    intelligence_weight = (data['powerstats']['intelligence'].to_f * 0.10)
    speed_weight = (data['powerstats']['speed'].to_f * 0.20)
    strength_weight = (data['powerstats']['strength'].to_f * 0.15)
    power_weight = (data['powerstats']['power'].to_f * 0.15)
    durability_weight = (data['powerstats']['durability'].to_f * 0.20)
    combat_weight = (data['powerstats']['combat'].to_f * 0.20)

    weighted_average = intelligence_weight + strength_weight + speed_weight + durability_weight + power_weight + combat_weight
    weighted_average.floor
  end
end