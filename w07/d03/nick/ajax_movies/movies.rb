require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'

get '/' do
  erb :search
end

get '/movie.json' do

  @title = params[:movie_name].gsub(' ', '%20')
  url = "http://www.omdbapi.com/?i=&t=#{@title}"

  @movie = HTTParty.get url
  @movie_info = JSON @movie

  content_type :json

@movie_info.to_json
end