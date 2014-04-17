class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @posts = @user.posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:image_url, :description)
    end

end
