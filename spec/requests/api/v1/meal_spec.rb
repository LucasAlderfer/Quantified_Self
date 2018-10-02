require 'rails_helper'

describe 'GET /api/v1/meals/:meal_id/foods' do
  it 'returns a meal according to the provided id with all its associated foods' do
    meal_1 = Meal.create(name: 'Breakfast')
    food_1 = Food.create(name: "Toast", calories: 300)
    food_2 = Food.create(name: "Apple", calories: 100)
    food_3 = Food.create(name: "Milk", calories: 150)
    meal_1.food_meals.create(food: food_1)
    meal_1.food_meals.create(food: food_2)
    meal_1.food_meals.create(food: food_3)
    expected = { 'id' => meal_1.id,
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
                 }
    get "/api/v1/meals/#{meal_1.id}/foods"

    expect(JSON.parse(response.body)).to eq(expected)
  end
  it 'returns a 404 if no meal exists with the provided id' do
    example = 10000
    expect(Meal.where(id: example).count).to eq 0

    get "/api/v1/meals/#{example}/foods"

    expect(response.status).to eq 404
  end
end
