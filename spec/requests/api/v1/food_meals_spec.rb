require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  it 'can add the food with the provided id to the meal with the provided id' do
    meal_1 = Meal.create(name: 'Breakfast')
    food_1 = Food.create(name: "Toast", calories: 300)
    food_2 = Food.create(name: "Apple", calories: 100)
    food_3 = Food.create(name: "Milk", calories: 150)
    meal_1.food_meals.create(food: food_1)
    meal_1.food_meals.create(food: food_2)
    expect(meal_1.foods.count).to eq(2)

    post "/api/v1/meals/#{meal_1.id}/foods/#{food_3.id}"

    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)).to eq({ 'message' => 'Successfully added Milk to Breakfast' })
    expect(meal_1.foods.count).to eq(3)
  end
  it 'returns a 404 if either the food or meal id provided is invalid' do
    example_food = 10000
    meal_1 = Meal.create(name: 'Breakfast')
    post "/api/v1/meals/#{meal_1.id}/foods/#{example_food}"
    expect(response.status).to eq(404)
    example_meal = 10000
    food_1 = Food.create(name: "Toast", calories: 300)
    post "/api/v1/meals/#{example_meal}/foods/#{food_1.id}"
    expect(response.status).to eq(404)
  end
end

describe 'DELETE /api/v1/meals/:meal_id/foods/:id' do
  it 'can remove the food with the provided id from the meal with the provided id' do
    meal_1 = Meal.create(name: 'Breakfast')
    food_1 = Food.create(name: "Toast", calories: 300)
    food_2 = Food.create(name: "Apple", calories: 100)
    food_3 = Food.create(name: "Milk", calories: 150)
    meal_1.food_meals.create(food: food_1)
    meal_1.food_meals.create(food: food_2)
    meal_1.food_meals.create(food: food_3)
    expect(meal_1.foods.count).to eq(3)

    delete "/api/v1/meals/#{meal_1.id}/foods/#{food_3.id}"

    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq({ 'message' => 'Successfully removed Milk from Breakfast' })
    expect(meal_1.foods.count).to eq(2)
  end
  it 'returns a 404 if either the food or meal id provided is invalid' do
    example_food = 10000
    meal_1 = Meal.create(name: 'Breakfast')
    delete "/api/v1/meals/#{meal_1.id}/foods/#{example_food}"
    expect(response.status).to eq(404)
    example_meal = 10000
    food_1 = Food.create(name: "Toast", calories: 300)
    delete "/api/v1/meals/#{example_meal}/foods/#{food_1.id}"
    expect(response.status).to eq(404)
  end
end
