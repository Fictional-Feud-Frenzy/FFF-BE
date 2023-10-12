class Character < ApplicationRecord
  validates :name, presence: true
  validates :intelligence, presence: true
  validates :strength, presence: true
  validates :speed, presence: true
  validates :durability, presence: true
  validates :power, presence: true
  validates :combat, presence: true
  validates :image, presence: true
end