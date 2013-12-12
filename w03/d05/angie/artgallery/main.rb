# encoding: UTF-8

require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "angiegove", #your progres app username
  :database => "artgallery",
  :pool => 20
  )


class Artist <ActiveRecord::Base # class must have a captial letter
  attr_accessible :name, :nationality, :dob
  has_many :artworks
end

class Artwork <ActiveRecord::Base
    attr_accessible :title, :image, :style, :year
    belongs_to :artist
end

get 'pry' do
  binding.pry
end

get '/' do
  @artists = Artist.all
  @artworks = Artwork.all
  erb :home
end
get '/artists/new' do

  @artists = Artist.all

  erb :artistnew
end

post 'artists/create' do
    artist = Artist.new
    artist.name = params[:name]
    artist.dob = params[:dob]
    artist.nationality = params[:nationality]
    artist.save
    redirect to '/artists'
    # artworks << artist
  end

get '/artists' do
  @artists = Artist.all
  erb :artist
end

 get '/artists/:artist_id/edit' do
    @artist = Artist.find(params[:artist_id])
    erb :artistnew
  end


  post '/artists/:artist_id/update' do
    @artist = Artist.find(params[:artist_id])
    @artist.name = params[:name]
    @artist.dob = params[:dob]
    @artist.nationality = params[:nationality]
    @artist.save
    redirect to '/artists'
  end

post 'artists/:artist_id/delete' do

  Artist.destroy(params[:artist_id])

  redirect to '/'
end

get '/artists/:artist_id' do
  @artist = Artist.where(:artist_id => params[:artist_id])
  if @artist.nil?
    redirect to '/'
  end
  erb :artist
end

get '/artworks/new' do

  erb :artworknew
end

post 'artworks/create' do
    @artist = Artist.find(params[:artist_id])
    artwork = Artwork.new
    artwork.title = params[:title]
    artwork.style = params[:style]
    artwork.year = params[:year]
    artwork.image = params[:image]
    artwork.save
    redirect to '/artworks'
     artists << artwork
  end

get '/artworks' do
  @artworks = Artwork.all
  erb :artwork
end

 get '/artworks/:artworks_id/edit' do
    @artworks = Artworks.find(params[:artworks_id])
    erb :artworksnew
  end


  post '/artworks/:artworks_id/update' do
    @artworks = Artworks.find(params[:artworks_id])
    @artworks.title = params[:title]
    @artworks.image = params[:image]
    @artworks.year = params[:year]
    @artworks.style = params[:style]
    @artworks.save

    redirect to '/artworks'
  end

post 'artworks/:artwork_id/delete' do

  Artwork.destroy(params[:artwork_id])

  redirect to '/'
end

get '/artwork/:artwork_id' do
  @artwork = Artwork.where(:artwork_id => params[:artwork_id])
  if @artwork.nil?
    redirect to '/'
  end
  erb :artwork
end





