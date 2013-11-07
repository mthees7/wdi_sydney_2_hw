class MountainsController < ApplicationController
  def home
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  def new
  end

  def create
    Mountain.create(params[:mountain])
    redirect_to mountains_path
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    mountain = Mountain.find(params[:id])
    mountain.update_attributes(params[:mountain])
    redirect_to mountains_path
  end

  def delete
    mountain = Mountain.find(params[:id])
    mountain.destroy
    redirect_to mountains_path
  end
end