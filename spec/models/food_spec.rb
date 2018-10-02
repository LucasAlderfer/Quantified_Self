require 'rails_helper'

describe Food do
  context 'validations' do
    it 'can be created' do
      food = Food.create!(name: 'Banana', calories: 150)
      expect(food).to be_valid
      expect(food.name).to eq('Banana')
      expect(food.calories).to eq(150)
    end
    it 'cannot be created without name or calories' do
      food_1 = Food.create(calories: 150)
      expect(food_1).to_not be_valid
      food_2 = Food.create(name: 'Banana')
      expect(food_2).to_not be_valid
    end
  end
  context 'relationships' do
    it 'has many food_meals' do
      food_1 = Food.create!(name: 'Apple', calories: 100)
      meal_1 = Meal.create!(name: 'Breakfast')
      meal_2 = Meal.create!(name: 'Lunch')
      food_meal_1 = food_1.food_meals.create!(meal: meal_1)
      food_meal_2 = food_1.food_meals.create!(meal: meal_2)
      expect(food_1.food_meals).to eq([food_meal_1, food_meal_2])
    end
    it 'has many meals through food_meals' do
      food_1 = Food.create!(name: 'Apple', calories: 100)
      meal_1 = Meal.create!(name: 'Breakfast')
      meal_2 = Meal.create!(name: 'Lunch')
      food_1.food_meals.create!(meal: meal_1)
      food_1.food_meals.create!(meal: meal_2)
      expect(food_1.meals).to eq([meal_1, meal_2])
    end
  end
end
