class ViewingPartiesController < ApplicationController

  def new
      @movie = MovieFacade.new(params[:id])
      @user = User.find(params[:user_id])
  end 

  def create 
    if session[:user_id] == nil 
      redirect_to '/'
      flash[:alert] = "Log in to create a viewing party"
    end
  end
end
