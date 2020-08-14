class CmpostsController < ApplicationController
  before_action :require_user_logged_in
  
 before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def _cmposts
    if logged_in?
      @cmpost = current_user.cmposts.build  # form_with 用
      @cmposts = current_user.cmoposts.order(id: :desc).page(params[:page])
    end 
  end
  
  def show
   
  end

  def new
     @cmpost = Cmpost.new
  end

  def create
     @cmpost = current_user.cmposts.build(cmpost_params)
     
    if @cmpost.save
      flash[:success] = 'CMを投稿しました。'
      redirect_to @cmpost
    else
      @cmposts = current_user.cmposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'CMの投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @cmpost.update(cmpost_params)
      flash[:success] = '投稿は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @cmpost.destroy
    flash[:success] = '投稿は正常に削除されました'
     redirect_to root_url
  
  end
  
  private

  def cmpost_params
    params.require(:cmpost).permit(:cm_url,:cm_title,:cm_service,:cm_music,:content)
  end
  
  def correct_user
    @cmpost = current_user.cmposts.find_by(id: params[:id])
    unless @cmpost
      redirect_to root_url
    end
  end
end