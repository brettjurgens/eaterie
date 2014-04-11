class AddIngredientIdToStepIngredients < ActiveRecord::Migration
  def change
    add_column :step_ingredients, :ingredient_id, :integer
  end
end
