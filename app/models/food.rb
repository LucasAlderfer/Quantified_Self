class Food < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :food_meals
  has_many :meals, through: :food_meals

  def self.most_eaten
    select('foods.*, count(food_meals.id) as timesEaten').joins(:food_meals).group(:id).order('timesEaten desc').limit(3)
  end

  def self.favorite_foods
    foods = Food.most_eaten
    foods.inject([]) do |array, food|
      times = food.food_meals.count
      #This only works for one food per amount, Going to need to be much much more crafty for the groups for each amount to be brought in together so that I don't manually make an array to pass in
      array << FavoriteFood.new(times, [food])
      array
    end
  end
end
