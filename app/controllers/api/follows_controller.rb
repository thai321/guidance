class Api::FollowsController < ApplicationController
  # before_action :require_login!
  protect_from_forgery
  def index
    @follows = Follow.all
    render json: @follows
  end

  def create
    # @follow = current_user.out_followscreate(followee_id: params[:user_id])
    if(!params[:follow])
      render json: ["You need to login or register to follow"], status: 422
    elsif (follow_params[:followee_id].to_i == follow_params[:follower_id].to_i)
      render json: ["You Can't follow yourself"], status: 422
    else
      @follow = Follow.new(followee_id: follow_params[:followee_id],
                            follower_id: follow_params[:follower_id]
                          )
      @follow.save
      # render json: @follow
      render json: {
        followeeId: @follow.followee_id,
        followerId: @follow.follower_id,
      }, status: 200
    end
  end

  def destroy
    # @follow = current_user.out_follows.find_by(followee_id: params[:user_id])
    @follow = Follow.find_by(
      followee_id: follow_params[:followee_id].to_i,
      follower_id: follow_params[:follower_id].to_i
    )

    @follow.destroy

    # render json: @follow
    render json: {
      followeeId: @follow.followee_id,
      followerId: @follow.follower_id,
    }, status: 200
  end

  private
  def follow_params
    params.require(:follow).permit(:followee_id, :follower_id)
  end
end
