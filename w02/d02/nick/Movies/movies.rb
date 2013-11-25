require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'

get '/' do
  erb:form
end

get '/movies' do
  @title = params[:movie_name]
  url = "http://www.omdbapi.com/?i=&t=#{@title}"

  @movie = HTTParty.get url
  @movie_info = JSON @movie
  erb :movies
end