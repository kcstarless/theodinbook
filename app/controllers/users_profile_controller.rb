# app/controllers/users_controller.rb
class UsersProfileController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_pending_reqeust, only: [:show]

  def show
    @posts = @user.posts  # all users post

    if current_user.id != @user.id  # check if profile is current users profile
      follow_request = FollowRequest.find_by(follower: current_user, followed: @user)
      @follow_request_status = follow_request ? follow_request.status : 'none'
    else
      @pending_request = FollowRequest.where(followed: current_user, status: 'pending')
      Rails.logger.info("PARAMS: #{@pending_request.inspect}")
      @follow_request_status = 'self'
    end


  end

  private

  def set_pending_reqeust

  end

  def set_user
    # Rails.logger.info("Params: #{params.inspect}")
    @user = User.find(params[:user_id])
  end
end
