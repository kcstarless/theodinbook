class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_posts] == 'true'
      @posts = current_user.posts
      @followed_posts = Post.where(user: current_user.following).order(created_at: :desc)
    else
      @posts = Post.all
    end

    @posts = sort_posts
  end

  def show
    @comments = @post.comments.order(created_at: :asc)
    @make_comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Posted created successfully."
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence.capitalize
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      # redirect_to users_profile_path(current_user), notice: "Post updated successfully."
      flash.now[:notice] = "Post successfully created."
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("tf_post#{@post.id}", partial: "posts/post", locals: { post: @post}) }
        format.html { redirect_to users_profile_path(current_user) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was successfully deleted." }
      format.turbo_stream
    end
  end

  private

  def sort_posts()
    @post = case params[:sort]
                  when 'recent'
                    @posts.order(created_at: :desc)
                  when 'oldest'
                    @posts.order(created_at: :asc)
                  when 'likes'
                    @posts.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
                  else
                    @posts
                  end
  end

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
