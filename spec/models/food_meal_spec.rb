require 'rails_helper'

describe FoodMeal do
  context 'validations' do
    it 'can be created' do
      food = Food.create(name: 'Banana', calories: 100)
      meal = Meal.create(name: 'Breakfast')
      food_meal = FoodMeal.create(food: food, meal: meal)
      expect(food_meal).to be_valid
    end
  end
  context 'relationships' do
    it 'belongs_to a meal' do
      food = Food.create(name: 'Banana', calories: 100)
      meal = Meal.create(name: 'Breakfast')
      food_meal = FoodMeal.create(food: food, meal: meal)
      expect(food_meal.meal).to eq(meal)
    end
    it 'belongs_to a food' do
      food = Food.create(name: 'Banana', calories: 100)
      meal = Meal.create(name: 'Breakfast')
      food_meal = FoodMeal.create(food: food, meal: meal)
      expect(food_meal.food).to eq(food)
    end
  end
end
