class LikesController < ApplicationController
    before_action :require_user_logged_in
   
  def create
    @cmpost = Cmpost.find(params[:cmpost_id])
    unless @cmpost.iine?(current_user)
      @cmpost.iine(current_user)
      flash[:success] = 'お気に入りに追加しました。'
     redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @cmpost = Like.find(params[:id]).cmpost
    if @cmpost.iine?(current_user)
      @cmpost.uniine(current_user)
       flash[:danger] = 'お気に入りを解除しました。'
      redirect_back(fallback_location: root_path)
    end
  end
end
