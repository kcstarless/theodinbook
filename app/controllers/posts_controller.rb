class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

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

end
