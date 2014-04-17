class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_url
    end
  end
  def fb_login
    redirect_to user_omniauth_authorize_path(:facebook)
  end
end
