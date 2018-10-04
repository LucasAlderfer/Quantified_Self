class Api::V1::FavoriteFoodsController < ApplicationController

  def index
    favorite_foods_array = Food.favorite_foods
    render json: FavoriteFoodPresenter.new(favorite_foods_array).info
  end

end
