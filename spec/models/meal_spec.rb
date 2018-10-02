require 'rails_helper'

describe Meal do
  context 'validations' do
    it 'can be created' do
      meal = Meal.create!(name: 'Breakfast')
      expect(meal).to be_valid
      expect(meal.name).to eq('Breakfast')
    end
    it 'cannot be created without name' do
      meal = Meal.create()
      expect(meal).to_not be_valid
    end
  end
  context 'relationships' do
    it 'has many food_meals' do
      food_1 = Food.create!(name: 'Apple', calories: 100)
      food_2 = Food.create!(name: 'Pear', calories: 150)
      meal_1 = Meal.create!(name: 'Breakfast')
      food_meal_1 = meal_1.food_meals.create!(food: food_1)
      food_meal_2 = meal_1.food_meals.create!(food: food_2)
      expect(meal_1.food_meals).to eq([food_meal_1, food_meal_2])
    end
    it 'has many foods through food_meals' do
      meal_1 = Meal.create!(name: 'Breakfast')
      food_1 = Food.create!(name: 'Apple', calories: 100)
      food_2 = Food.create!(name: 'Pear', calories: 150)
      meal_1.food_meals.create!(food: food_1)
      meal_1.food_meals.create!(food: food_2)
      expect(meal_1.foods).to eq([food_1, food_2])
    end
  end
end
