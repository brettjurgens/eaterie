class Post < ActiveRecord::Base
  acts_as_commentable
  has_one :recipe
  belongs_to :user
end
