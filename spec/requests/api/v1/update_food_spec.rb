require 'rails_helper'

describe 'PATCH api/v1/foods/:id' do
  context 'it can update a food' do
    it 'updates a food with valid fields' do
      food = Food.create(name: 'Banana', calories: 150)
      food_params = { "food": { "name": "Banana", "calories": 200 } }
      expected = {'id' => food.id, 'name' => "Banana", 'calories' => 200}

      patch "/api/v1/foods/#{food.id}", params: food_params

      expect(JSON.parse(response.body)).to eq(expected)
    end
    it 'does not create a food without valid fields' do
      food = Food.create(name: 'Banana', calories: 150)
      food_params = { "food": { "name": '',"calories": 200 } }

      patch "/api/v1/foods/#{food.id}", params: food_params

      expect(response.status).to eq(400)
    end
    it 'renders 404 if the id is invalid' do
      food = Food.create(name: 'Banana', calories: 150)
      food_params = { "food": { "name": "Banana", "calories": 200 } }
      patch "/api/v1/foods/10000", params: food_params
      expect(response.status).to eq(404)
    end
  end
end
