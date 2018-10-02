require 'rails_helper'

describe 'GET /api/v1/meals' do
  it 'returns all meals with the associated foods for each meal' do
    meal_1 = Meal.create(name: 'Breakfast')
    meal_2 = Meal.create(name: 'Lunch')
    food_1 = Food.create(name: "Toast", calories: 300)
    food_2 = Food.create(name: "Apple", calories: 100)
    food_3 = Food.create(name: "Milk", calories: 150)
    meal_1.food_meals.create(food: food_1)
    meal_1.food_meals.create(food: food_2)
    meal_1.food_meals.create(food: food_3)
    meal_2.food_meals.create(food: food_2)
    meal_2.food_meals.create(food: food_3)
    expected = [{ 'id' => meal_1.id,
                  'name' => meal_1.name,
                  'foods' => [ { 'id' => food_1.id,
                                 'name' => food_1.name,
                                 'calories' => food_1.calories },
                               { 'id' => food_2.id,
                                 'name' => food_2.name,
                                 'calories' => food_2.calories },
                               { 'id' => food_3.id,
                                 'name' => food_3.name,
                                 'calories' => food_3.calories }
                             ]
                 },
                 { 'id' => meal_2.id,
                   'name' => meal_2.name,
                   'foods' => [ { 'id' => food_2.id,
                                  'name' => food_2.name,
                                  'calories' => food_2.calories },
                                { 'id' => food_3.id,
                                  'name' => food_3.name,
                                  'calories' => food_3.calories }
                              ]
                  }]
    get '/api/v1/meals'

    expect(JSON.parse(response.body)).to eq(expected)
  end
end
