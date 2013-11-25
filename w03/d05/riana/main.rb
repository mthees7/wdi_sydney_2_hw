require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'fuzzyri',
  :password => '',
  :database => "art",
  :pool => 20
  )

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Artist < ActiveRecord::Base
  attr_accessible :name
  has_many :artworks

  def to_s
    "Artist #{name}"
  end
end

class Artwork < ActiveRecord::Base
  attr_accessible :name, :artist_id
  belongs_to :artist

  def to_s
    "Artwork #{name}"
  end
end

get '/' do
  @all_artists = Artist.all
  @all_artworks = Artwork.all
  erb :home
end

get '/artist' do
  @all_artists = Artist.all
  erb :artist
end

post '/artist/new' do
  @new_artist = Artist.new
  @new_artist.name = params[:name]
  @new_artist.save
  redirect to '/'
end

get '/artist/:artist_id' do
  @artist = Artist.find(params[:artist_id])
  erb :artist
end

post '/artist/:artist_id' do
  @edit_artist = Artist.find(params[:artist_id])
  @edit_artist.name = params[:name]
  @edit_artist.save
  redirect to '/'
end

get '/artist/:artist_id/delete' do
  @delete_artist = Artist.find(params[:artist_id])
  @delete_artist.destroy
  redirect to '/'
end

get '/artwork' do
  @all_artworks = Artwork.all
  @all_artists = Artist.all
  erb :artwork
end

post '/artwork/new' do
  @new_artwork = Artwork.new
  @new_artwork.name = params[:name]
  @new_artwork.save
  redirect to '/'
end

get '/artwork/:artwork_id' do
  @artwork = Artwork.find(params[:artwork_id])
  @all_artists = Artist.all
  erb :artwork
end

post '/artwork/:artwork_id' do
  @the_artist = Artist.find(params[:artist_id])
  @edit_artwork = Artwork.find(params[:artwork_id])
  @edit_artwork.name = params[:name]
  @edit_artwork.artist_id = @the_artist.id
  @edit_artwork.save
  redirect to '/'
end

get '/artwork/:artwork_id/delete' do
  @delete_artwork = Artwork.find(params[:artwork_id])
  @delete_artwork.destroy
  redirect to '/'
end


