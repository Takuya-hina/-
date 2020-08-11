class CmpostsController < ApplicationController
  before_action :require_user_logged_in
 before_action :correct_user, only: [:edit, :update, :destroy]
  def show
  end

  def new
  end

  def create
     @cmpost = current_user.cmposts.build(cmpost_params)
    if @cmpost.save
      flash[:success] = 'CMを投稿しました。'
      redirect_to root_url
    else
      @cmposts = current_user.cmposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'CMの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    @cmpost.destroy
    flash[:success] = '投稿は正常に削除されました'
     redirect_to cmposts_url
  
  end
  
  private

  def cmpost_params
    params.require(:cmpost).permit(:content)
  end
  
  def correct_user
    @cmpost = current_user.cmposts.find_by(id: params[:id])
    unless @cmpost
      redirect_to root_url
    end
  end
end
