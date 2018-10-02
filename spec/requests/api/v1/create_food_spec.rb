require 'rails_helper'

describe 'POST api/v1/foods' do
  context 'it can create a food' do
    it 'creates a food with valid fields' do
      allow_any_instance_of(Food).to receive(:id).and_return(1)
      food_params = { "food": { "name": "Banana", "calories": 150 } }

      expected = {'id' => 1, 'name' => "Banana", 'calories' => 150}

      post '/api/v1/foods', params: food_params

      expect(JSON.parse(response.body)).to eq(expected)
    end
    it 'does not create a food without valid fields' do
      food_params_1 = { "food": {"calories": 150 } }
      post '/api/v1/foods', params: food_params_1
      expect(response.status).to eq(404)
      food_params_2 = { "food": { "name": "Banana" } }
      post '/api/v1/foods', params: food_params_2
      expect(response.status).to eq(404)
    end
  end
end
