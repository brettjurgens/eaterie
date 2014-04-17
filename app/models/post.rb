class Post < ActiveRecord::Base
  acts_as_commentable
  acts_as_likeable
  has_one :recipe
  belongs_to :user
end
