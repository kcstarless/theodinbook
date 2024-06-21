class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:liked]

  def liked
    if @post.user_id == current_user.id
      redirect_to @post, alert: 'You cannot like your own post.'
    elsif current_user.liked_post?(@post)
      redirect_to @post, notice: 'You already liked this post.'
    else
      @liked = current_user.likes.new(posted: params[:id])

      if @liked.save
        redirect_to post_path, notice: 'You liked the post.'
      else
        # Rails.logger.error("Failed to save @liked: #{@liked.errors}")
        redirect_to post_path, notice: 'Unable to like the post.'
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # def like_params
  #   params.require(:like).permit(:posted)
  # end
end
