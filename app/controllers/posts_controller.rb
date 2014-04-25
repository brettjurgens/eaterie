class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comment ]
  before_action :authenticate_user!, :except => :show

  # GET /posts
  # GET /posts.json
  def index
    follows = current_user.followees(User)
    if follows.length == 0
      @posts = []
    elsif
      followees = []
      followees << current_user
      follows.each do |followee|
        followees << followee
      end
      # SELECT * FROM Posts WHERE user_id=ANY(ARRAY[1,2])
      @posts = Post.where("user_id=ANY(ARRAY [?])", followees).order('updated_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/1/comment
  # POST /posts/1/comment
  def comment
    if params[:comment].nil? or params[:comment].length == 0
      return
    end
    @comment = @post.comments.new
    @comment.comment = params[:comment]
    @comment.user = current_user
    @comment.save

    comment_html = render_to_string(:partial => 'comments/comment', :object => @comment)
    render json: { success: true, html: comment_html }
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @post }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post =
        case
          when id = params[:id]
            Post.find(id)
          when id = params[:post_id]
            Post.find(id)
        end

      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:image_url, :description)
    end
end
