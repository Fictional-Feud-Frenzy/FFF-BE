class Character < ApplicationRecord
  validates :name, presence: true
  validates :intelligence, presence: true
  validates :strength, presence: true
  validates :speed, presence: true
  validates :durability, presence: true
  validates :power, presence: true
  validates :combat, presence: true

  # def initialize(data)
  #   @name = data[name]
  #   @full_name = data[biography][full_name]
  #   @power_stats_weighted_average = weighted_avg
  # end

  # def weighted_avg(data)
    # data[powerstats][speed]*.20 + data[powerstats][strength]*.20 + data[powerstats][durability]*.20 + data[powerstats][power]*.20 + data[powerstats][combat]*.20
  # end
end