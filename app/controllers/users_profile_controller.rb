# app/controllers/users_controller.rb
class UsersProfileController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!
  # before_action :set_pending_reqeust, only: [:show]

  def show
    @user_viewing = current_user.id == @user.id

    @posts = @user.posts  # all users post

    if current_user.id != @user.id  # check if profile is current users profile
      follow_request = FollowRequest.find_by(follower: current_user, followed: @user)
      @follow_request_status = follow_request ? follow_request.status : 'none'
    else
      @pending_request = FollowRequest.where(followed: current_user, status: 'pending')
      # Rails.logger.info("PARAMSSSSSSSSS: #{@pending_request.inspect}")
      @follow_request_status = 'self'
    end
  end

  def edit_avatar
    @user = current_user
  end

  def update_avatar
    @user = current_user
    # Rails.logger.info("Avatar URL #{params[:user][:avatar_url]}")
    if params[:user][:avatar].present?
      @user.avatar.purge if @user.avatar.attached?
      @user.avatar.attach(params[:user][:avatar])
      @user.avatar_url = url_for(@user.avatar)
    else
      @user.avatar_url = params[:user][:avatar_url]
    end

    if @user.save
      redirect_to users_profile_path(@user), notice: 'Avatar was successfully updated.'
    else
      redirect_to edit_avatar_users_profile_path(@user), alert: 'Avatar could not be saved.'
    end
  end

  private

  # def set_pending_reqeust

  # end

  def set_user
    # Rails.logger.info("Params: #{params.inspect}")
    @user = User.find(params[:user_id])
  end
end
