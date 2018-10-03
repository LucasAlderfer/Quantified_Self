class Api::V1::FavoriteFoodsController < ApplicationController

  def index
    render json: Food.favorite_foods
  end

end
