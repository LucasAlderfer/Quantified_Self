class CreateFoodMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :food_meals do |t|
      t.references :food
      t.references :meal
    end
  end
end
