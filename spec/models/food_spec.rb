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
  context 'class methods' do
    it 'can find favorite foods' do
      meal_1 = Meal.create(name: 'Breakfast')
      meal_2 = Meal.create(name: 'Lunch')
      meal_3 = Meal.create(name: 'Dinner')
      meal_4 = Meal.create(name: 'Snack')
      meal_5 = Meal.create(name: 'Brunch')
      food_1 = Food.create(name: "Toast", calories: 300)
      food_2 = Food.create(name: "Apple", calories: 100)
      food_3 = Food.create(name: "Milk", calories: 150)
      food_4 = Food.create(name: "Water", calories: 0)
      food_5 = Food.create(name: "OrangeJuice", calories: 250)
      meal_1.food_meals.create(food: food_1)
      meal_1.food_meals.create(food: food_2)
      meal_1.food_meals.create(food: food_3)
      meal_1.food_meals.create(food: food_4)
      meal_1.food_meals.create(food: food_5)
      meal_2.food_meals.create(food: food_1)
      meal_2.food_meals.create(food: food_2)
      meal_2.food_meals.create(food: food_3)
      meal_2.food_meals.create(food: food_4)
      meal_3.food_meals.create(food: food_1)
      meal_3.food_meals.create(food: food_2)
      meal_3.food_meals.create(food: food_3)
      meal_4.food_meals.create(food: food_1)
      meal_4.food_meals.create(food: food_2)
      meal_5.food_meals.create(food: food_1)
      expected = [FavoriteFood.new(5, [food_1]), FavoriteFood.new(4, [food_2]), FavoriteFood.new(3, [food_3])]
      expect(Food.favorite_foods).to eq(expected)
    end
  end
end
