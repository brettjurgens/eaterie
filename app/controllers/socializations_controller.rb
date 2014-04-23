class SocializationsController < ApplicationController
  before_filter :load_socializable

  def toggle_follow
    follows = current_user.toggle_follow!(@socializable)
    render json: { follow: follows }
  end

  def toggle_like
    likes = current_user.toggle_like!(@socializable)
    new_like_info = @socializable.likes
    render json: { like: likes, like_info: new_like_info }
  end

  private
  def load_socializable
    @socializable =
        case
          when id = params[:post_id]
            Post.find(id)
          when id = params[:user_id] # Must be before :item_id, since it's nested under it.
            User.find(id)
          else
            raise ArgumentError, "Unsupported socializable model, params: " +
                params.keys.inspect
        end
    raise ActiveRecord::RecordNotFound unless @socializable
  end

end
