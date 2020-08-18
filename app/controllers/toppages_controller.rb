class ToppagesController < ApplicationController
  def index
     if logged_in?
      @cmposts = Cmpost.all.order(id: :desc).page(params[:page])
     end
  end
end
