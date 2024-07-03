class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.where.not(id: current_user.id)
    @follow_requests = {}

    @users.each do |user|
      follow_request = FollowRequest.find_by(follower: current_user, followed: user)
      @follow_requests[user.id] = follow_request.status if follow_request
    end
  end
end
