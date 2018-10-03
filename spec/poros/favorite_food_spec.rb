require 'rails_helper'

describe FavoriteFood do
  it 'can be created' do
    food_1 = Food.create(name: "Toast", calories: 300)
    food_2 = Food.create(name: "Apple", calories: 100)
    ff = FavoriteFood.new(4, [food_1, food_2])
    expect(ff.timesEaten).to eq(4)
    expect(ff.foods).to eq([food_1, food_2])
  end
end
