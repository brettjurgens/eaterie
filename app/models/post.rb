class Post < ActiveRecord::Base
  has_one :recipe
  validates :recipe_id, presence: true
end
