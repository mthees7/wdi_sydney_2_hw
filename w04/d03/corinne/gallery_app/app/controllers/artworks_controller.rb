class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find params[:id]
  end

  def new
    @artwork = Artwork.new
  end

  def create
    artwork = Artwork.create params[:artwork]

    redirect_to artwork_path(artwork.id)
  end


  def edit
    @artwork = Artwork.find params[:id]
  end

  def update
    artwork = Artwork.find params[:id]
    artwork.update_attributes params[:artwork]
    redirect_to artwork_path(artwork.id)
  end

  def destroy
    artwork = Artwork.find params[:id]
    artwork.destroy
    redirect_to artworks_path
  end



end