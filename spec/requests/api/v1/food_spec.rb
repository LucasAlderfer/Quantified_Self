require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  context 'returns the food with that id' do
    it 'shows the food with that id' do
      food = Food.create!(name: 'Banana', calories: 150)
      expected = {'id' => food.id, 'name' => food.name, 'calories' => food.calories}

      get "/api/v1/foods/#{food.id}"
      output = JSON.parse(response.body)
      expect(output).to eq(expected)
    end
    it 'returns a 404 if no food has that id' do
      food = Food.create!(name: 'Banana', calories: 150)

      get "/api/v1/foods/10000"
      expect(response.status).to eq(404)
    end
  end
end
