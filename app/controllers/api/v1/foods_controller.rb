class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
    unless Food.where(id: params[:id]).count == 0
      render json: Food.find(params[:id])
    else
      render status: 404
    end
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: Food.create(food_params)
    else
      render status: 404
    end
  end

  def update
    unless Food.where(id: params[:id]).count == 0
      food = Food.find(params[:id])
      food.update(food_params)
      if food.save
        render json: food
      else
        render status: 400
      end
    else
      render status: 404
    end
  end

  def destroy
    unless Food.where(id: params[:id]).count == 0
      Food.delete(params[:id])
      render status: 204
    else
      render status: 404
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end

end
