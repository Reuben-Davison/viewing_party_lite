class ViewingPartiesController < ApplicationController

  def new
      @movie = MovieFacade.new(params[:id])
      @user = User.find(params[:user_id])
  end 

  def create 
  end
end
