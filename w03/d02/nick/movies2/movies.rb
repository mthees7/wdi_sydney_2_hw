require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'CSV'


get '/' do
  #just displaying a form
  erb :form
end

get '/movies' do
  @movie = params[:movie_name]
  url = "http://www.omdbapi.com/?i=&t=#{@movie}"
  @movie = HTTParty.get url
  @movie_info = JSON @movie
  erb :index
end
