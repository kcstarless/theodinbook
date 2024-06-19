class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: [:accept, :reject]
  before_action :authenticate_user!

  def create
    @follow_request = FollowRequest.new(follow_request_params)
    @follow_request.follower = current_user
    @follow_request.status = 'pending'

    if @follow_request.save
      redirect_to users_path, notice: 'Follow request sent.'
    else
      redirect_to users_path, alert: 'Unable to send follow request.'
    end
  end


  private

  def set_follow_request
    @follow_request = FollowRequest.find(params[:id])
  end

  def follow_request_params
    params.require(:follow_request).permit(:followed_id)
  end
end
