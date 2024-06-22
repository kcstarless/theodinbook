class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_posts] == 'true'
      @posts = current_user.posts
    else
      @posts = Post.all
    end

    @followed_posts = Post.where(user: current_user.following).order(created_at: :desc)
  end

  def show
    @comments = @post.comments
    @make_comment = Comment.new
    # Rails.logger.info("XXXXXXXXXXXXXXXXXXXXXXXXXXXX: #{@comments.inspect}")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Posted created successfully."
    else
      render :new
    end
  end

  def edit

  end

  def update
      if @post.update(post_params)
        redirect_to posts_path, notice: "Post updated successfully."
      else
        render :edit
      end
  end

  def destroy
    @post.destroy
    redirect_to quotes_path, notice: "Post was successfully deleted."
  end

  private

  def authenticate_user!
    unless current_user
      redirect_to new_user_session_path, alert: "You need to sign in to access this page"
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :user_id, :title)
  end

  # def comment_params
  #   params.require(:comment).permit(:user_id, :post_id, :body)
  # end
end
