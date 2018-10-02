class Api::V1::FoodMealsController < ApplicationController

  def create
    unless (Food.where(id: params[:id]).count == 0) || (Meal.where(id: params[:meal_id]).count == 0)
      food = Food.find(params[:id])
      meal = Meal.find(params[:meal_id])
      FoodMeal.create(food: food, meal: meal)
      render json: {message: "Successfully added #{food.name} to #{meal.name}"}.to_json, status: 201
    else
      render status: 404
    end
  end

  def destroy
    unless (Food.where(id: params[:id]).count == 0) || (Meal.where(id: params[:meal_id]).count == 0)
      food = Food.find(params[:id])
      meal = Meal.find(params[:meal_id])
      foodmeal = FoodMeal.find_by_food_id_and_meal_id(food.id, meal.id)
      FoodMeal.delete(foodmeal.id)
      render json: {message: "Successfully removed #{food.name} from #{meal.name}"}.to_json
    else
      render status: 404
    end
  end

end
