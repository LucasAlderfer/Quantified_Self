class FavoriteFoodPresenter

  def initialize(array)
    @food_array = array
  end

  def info
    json_array = []
    @food_array.each do |favorite_food|
      favorite_food_hash = {}
      favorite_food_hash['timesEaten'] = favorite_food.timesEaten
      favorite_food_hash['foods'] = favorite_food.foods.map do |food|
        food_hash = {}
        food_hash['calories'] = food.calories
        food_hash['name'] = food.name
        food_hash['mealsWhenEaten'] = food.meals.map do |meal|
          meal.name
        end
        food_hash
      end
      unless favorite_food_hash['timesEaten'] <= 1
        json_array << favorite_food_hash
      end
    end
    json_array
  end

end
