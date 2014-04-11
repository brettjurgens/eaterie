class RecipeStep < ActiveRecord::Base
  belongs_to :recipe
  has_many :step_ingredients
end
