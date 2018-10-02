require 'rails_helper'

describe 'GET /api/v1/favorite_foods' do
  it 'can return the foods with the three highest timesEaten values, and the meals when those foods were eaten' do
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
    expected = [
                { 'timesEaten' => 5,
                  'foods' => [
                              { 'name' => 'Toast',
                                'calories' => 300,
                                'mealsWhenEaten' => [
                                  'Breakfast',
                                  'Lunch',
                                  'Dinner',
                                  'Snack',
                                  'Brunch'
                                                    ]
                              }
                             ]
                },
                { 'timesEaten' => 4,
                  'foods' => [
                              { 'name' => 'Apple',
                                'calories' => 100,
                                'mealsWhenEaten' => [
                                  'Breakfast',
                                  'Lunch',
                                  'Dinner',
                                  'Snack'
                                                    ]
                              }
                             ]
                },
                { 'timesEaten' => 3,
                  'foods' => [
                              { 'name' => 'Milk',
                                'calories' => 150,
                                'mealsWhenEaten' => [
                                  'Breakfast',
                                  'Lunch',
                                  'Dinner'
                                                    ]
                              }
                             ]
                }
               ]
    get '/api/v1/favorite_foods'

    expect(JSON.parse(response.body)).to eq(expected)
  end
end
