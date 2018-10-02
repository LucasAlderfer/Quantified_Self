class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    unless Meal.where(id: params[:meal_id]).count == 0
      render json: Meal.find(params[:meal_id])
    else
      render status: 404
    end
  end

end
