class CreateStepIngredients < ActiveRecord::Migration
  def change
    create_table :step_ingredients do |t|
      t.string :amount

      t.timestamps
    end
  end
end
