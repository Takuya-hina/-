class ToppagesController < ApplicationController
  def index
     if logged_in?
      @cmposts = Cmpost.all.order(id: :desc).page(params[:page]).per(10)
     end
  end
  
  def search
    @cmposts = Cmpost.where(['cm_service LIKE? OR cm_music LIKE? OR cm_title LIKE?', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%"]).page(params[:page]).per(20)
    render action: :index
  end
end
