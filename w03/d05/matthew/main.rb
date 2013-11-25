require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'matthewthees',
  :password => '',
  :database => "gallery"
  )


class Artist < ActiveRecord::Base
  attr_accessible :name, :picture, :country

  has_many :works
end


class Work < ActiveRecord::Base
  attr_accessible :title, :image, :year

  belongs_to :artist
end



get '/' do

  erb :homepage
end


get '/artists' do
  @artists = Artists.all

  erb :artists
end


get '/artists/new' do

  erb :newartist
end


get '/works' do
  @works = Work.all

  erb :works
end


get '/works/new' do

  erb :newwork
end





post '/artist/create' do
  @artist = Artist.new

  @artist.name = params[:title]
  @artist.picture = params[:picture]
  @artist.dob = params[:dob]

  @artist.save

  redirect to '/artists'
end


post '/work/create' do
  @work = Work.new

  @work.title = params[:title]
  @work.image = params[:image]
  @work.year = params[:year]

  @work.save

  redirect to '/works'
end




