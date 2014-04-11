class AddPostIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :post_id, :integer
  end
end
