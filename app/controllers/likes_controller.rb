class LikesController < ApplicationController
  def create
    @cmpost = Cmpost.find(params[:cmpost_id])
    @cmpost.iine(current_user)
  end

  def destroy
    @cmpost = Like.find(params[:id]).cmpost
    @cmpost.uniine(current_user)
  end
end
