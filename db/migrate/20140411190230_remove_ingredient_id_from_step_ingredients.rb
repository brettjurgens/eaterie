class RemoveIngredientIdFromStepIngredients < ActiveRecord::Migration
  def change
    remove_column :step_ingredients, :ingredient_id, :integer
  end
end
