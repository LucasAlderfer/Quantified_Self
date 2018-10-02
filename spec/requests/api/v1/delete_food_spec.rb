require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  it 'can delete the food with the given id' do
    food = Food.create(id: 1, name: "Banana", calories: 150)

    expect(Food.where(id: food.id).count).to eq 1

    delete "/api/v1/foods/#{food.id}"

    expect(Food.where(id: food.id).count).to eq 0
    expect(response.status).to eq(204)
  end
  it 'will return a 404 if the food does not exist for the id provided' do
    example = 10000
    expect(Food.where(id: example).count).to eq 0

    delete "/api/v1/foods/#{example}"

    expect(response.status).to eq(404)
  end
end
