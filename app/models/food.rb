class Food < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :food_meals
  has_many :meals, through: :food_meals
end
