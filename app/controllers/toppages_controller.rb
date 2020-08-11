class ToppagesController < ApplicationController
  def index
     if logged_in?
      @cmposts = current_user.cmposts.order(id: :desc).page(params[:page])
     end
  end
end
