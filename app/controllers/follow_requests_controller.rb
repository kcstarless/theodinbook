class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: [:accept, :reject]
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    @follow_request = current_user.active_follow_requests.new(followed_id: @user.id)
    @follow_request.status = 'pending'

    if @follow_request.save
      redirect_to user_path, notice: 'Follow request sent.'
    else
      redirect_to users_path, alert: 'Unable to send follow request.'
    end
  end

  def accept
    if @follow_request.update(status: 'accepted')
      redirect_to user_path(@follow_request.followed), notice: 'Follow request accepted.'
    else
      redirect_to user_path(@follow_request.followed), alert: 'Unable to accept follow request.'
    end
  end

  def reject
    if @follow_request.update(status: 'rejected')
      redirect_to users_profile_path(@follow_request.followed), notice: 'Follow request rejected.'
    else
      redirect_to users_profile_path(@follow_request.followed), alert: 'Unable to reject follow request.'
    end
  end

  def destroy
    @follow_request = current_user.active_follow_requests.find_by(followed_id: params[:id])

    if @follow_request
      @follow_request.destroy
      redirect_to user_path(params[:id]), notice: 'Unfollowed successfully.'
    else
      redirect_to user_path(params[:id]), alert: 'Unable to unfollow.'
    end
  end

  private

  def set_follow_request
    Rails.logger.info("XXXXXXXX: #{params.inspect}")
    @follow_request = FollowRequest.find(params[:id])
  end

  def follow_request_params
    params.require(:follow_request).permit(:followed_id)
  end
end