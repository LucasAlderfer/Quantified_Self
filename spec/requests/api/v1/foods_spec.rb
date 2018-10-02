require 'rails_helper'

describe 'GET /api/v1/foods' do
  context 'returns all foods' do
    it 'shows each food with its id, name and calories' do
      food_1 = Food.create(name: "Banana", calories: 150)
      food_2 = Food.create(name: "Apple", calories: 100)
      food_3 = Food.create(name: "Pear", calories: 200)
      expected = [{'id' => food_1.id, 'name' => food_1.name, 'calories' => food_1.calories},
                  {'id' => food_2.id, 'name' => food_2.name, 'calories' => food_2.calories},
                  {'id' => food_3.id, 'name' => food_3.name, 'calories' => food_3.calories}]
      get '/api/v1/foods'

      foods = JSON.parse(response.body)
      expect(foods).to eq(expected)
    end
  end
end
