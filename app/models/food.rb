class Food < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :food_meals
  has_many :meals, through: :food_meals

  def self.most_eaten
    select('foods.*, count(food_meals.id) as timesEaten').joins(:food_meals).group(:id).order('timesEaten desc').all
  end

  def self.top_times_eaten
    foods_in_order = Food.most_eaten
    counts = []
    foods_in_order.each do |food|
      count = food.food_meals.count
      unless counts.include?(count)
        counts << count
        return counts if counts.length == 3
        (return counts if counts.length == Food.count) if Food.count <= 2
      end
    end
  end

  def self.favorite_foods
    array = []
    counts = Food.top_times_eaten
    count_hash = counts.inject({}) do |hash, count|
      foods = Food.all
      food_array = []
      foods.each do |food|
        if food.food_meals.count == count
          food_array << food
          food_array
        end
      end
      hash[count] = food_array
      hash
    end
    count_hash.each do |times, food|
      array << FavoriteFood.new(times, food)
    end
    array
  end
end
