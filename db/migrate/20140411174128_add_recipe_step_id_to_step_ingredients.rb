class AddRecipeStepIdToStepIngredients < ActiveRecord::Migration
  def change
    add_column :step_ingredients, :recipe_step_id, :integer
  end
end
