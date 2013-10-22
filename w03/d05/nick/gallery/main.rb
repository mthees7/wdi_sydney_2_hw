require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "nickdoherty",
  :database => "streetart",
  :pool => 20
  )

class Artist < ActiveRecord::Base
  attr_accessible :name, :location, :style, :profile_pic
  has_many :artworks
end

class Artwork < ActiveRecord::Base
  attr_accessible :title, :artist_id, :info, :image
  belongs_to :artist
end

# before do
#   @locations = Artist.select(:location).uniq
# end

get '/' do
   erb :home
end

get '/artists' do
  @artist = Artist.order('id desc')

  erb :artists
end

get '/artists/new' do
   erb :artist
end

post '/artists/artist/create' do
  artist = Artist.new
  artist.name = params[:name]
  artist.location = params[:location]
  artist.style = params[:style]
  artist.profile_pic = params[:profile_pic]
  artist.save

  redirect to '/artists'
end

post '/artists/:artist_id/update' do
  artist = Artist.find(params[:id])
  artist.name = params[:name]
  artist.location = params[:location]
  artist.style = params[:style]
  artist.profile_pic = params[:profile_pic]
  artist.save

  redirect to '/artists'
end

get '/artworks/new' do
   erb :artwork
end

post '/artworks/artwork/create' do
  artwork = Artwork.new
  artwork.title = params[:title]
  artwork.info = params[:info]
  artwork.image = params[:image]
  artwork.save

  redirect to '/artworks'
end

post '/artworks/:artwork_id/update' do
  artwork = Artwork.find(params[:id])
  artwork.title = params[:title]
  artwork.info = params[:info]
  artwork.image = params[:image]
  artwork.save

  redirect to '/artworks'
end