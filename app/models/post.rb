class Post < ActiveRecord::Base
  acts_as_commentable
  acts_as_likeable
  has_one :recipe
  accepts_nested_attributes_for :recipe
  belongs_to :user

  # return a string with the first 2 likers and a quantity
  def likes
    likers = likers(User)
    str = ''

    if likers.length == 1
      str = "#{likers[0].name} likes this"
    elsif likers.length == 2
      str = "#{likers[0].name} and #{likers[1].name} like this"
    elsif likers.length > 2
      str = "#{likers[0].name}, #{likers[1].name} and #{likers.length - 2} others like this"
    end

    return str
  end
end
