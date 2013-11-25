require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'corinne2', #your postgres.app username
  :password => '',
  :database => "gallery",
  :pool => 20
)

class Artist <ActiveRecord::Base
  attr_accessible :artist_name, :dob, :nationality
  has_many :artworks
end

class Artwork < ActiveRecord::Base
  attr_accessible :artwork_artist, :artwork_title, :year, :photo
 belongs_to :artist
end

get '/pry' do
  binding.pry
end

before do
  @nav_artists = Artist.all
  @artists = Artist.all #find out how to alphebitaize by last name.  maybe: .order.somthing?

end

# ------ Main ------

get '/' do
  @artworks = Artwork.all
  @artists = Artist.all
  erb :home
end

get '/home' do
  @artworks = Artwork.all
  @artists = Artist.all
  erb :home
end

get '/artists' do
  @artists = Artist.all
  erb :artist
end

get '/artworks' do
  @artworks = Artwork.all
  erb :artwork
end

# ------ Artist New ------

get '/artists/new' do
  erb :new_artist
end

post '/artists/create' do
  artist = Artist.new
  artist.artist_name = params[:artist_name]
  artist.dob = params[:dob]
  artist.nationality = params[:nationality]
  artist.save
  redirect to '/'
end


# ------ Artwork New ------

get '/artworks/new' do
  @artists = Artist.all

  erb :new_artwork
end

post '/artworks/create' do
  artwork = Artwork.new
  # artwork.artwork_artist = params[:artwork_artist]
  artwork.artwork_title = params[:artwork_title]
  artwork.year = params[:year]
  artwork.photo = params[:photo]

  #*** THEN THIS
  @artist = Artist.find params[:dropmenu_artist]
  @artist.artworks << artwork
  artwork.save

  #*** OR THIS#
# @artist_id = params[:dropmenu_artist]
#  @artists.save

  #***

  redirect to "/"

end



# ------ Artist Edit ------


get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :new_artist
end


post '/artists/:id/update' do
  artist = Artist.new
  artist.artist_name = params[:artist_name]
  artist.dob = params[:dob]
  artist.nationality = params[:nationality]
  artist.save
  redirect to '/'
end



# ------ Artwork Edit ------

get '/artworks/:id/edit' do
  @artwork = Artwork.find(params[:id])
  erb :new_artwork
end

post '/artworks/:id/update' do
  artwork = Artwork.find(params[:id])
#  artwork.artwork_artist = params[:artwork_artist]
  artwork.artwork_title = params[:artwork_title]
  artwork.year = params[:year]
  artwork.photo = params[:photo]
  artwork.save
  redirect to "/"
end




# ------ Artist Delete ------

post '/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect to '/'
end


# ------ Artwork Delete ------

post '/artworks/:id/delete' do
  Artwork.destroy(params[:comment_id])
  redirect to "/"
end


# ------ Other ------

get '/artists/:id' do
  @artists = Artist.where(:id => params[:id])
#  @artworks = Artwork.where(:artist_id => params[:id])
  if @artists.nil?
    redirect to '/'
  end
  erb :artist
end


get '/artworks/:id' do
  @artworks = Artwork.where(:id => params[:id])
  if @artworks.nil?
    redirect to '/'
  end
  erb :artwork
end

#*************************
# DO I MORE?????
get '/artworks/artist/:artist' do
  @artworks = Artwork.where("artist = ?", params[:artist])
  erb :artwork
end
#*************************





