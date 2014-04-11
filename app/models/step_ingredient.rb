class StepIngredient < ActiveRecord::Base
  belongs_to :recipe_step
  has_many :ingredients
end
