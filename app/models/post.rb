class Post < ActiveRecord::Base
  has_one :recipe
end
