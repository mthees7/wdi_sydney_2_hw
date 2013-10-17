require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'


get '/' do


  @movie = params[:title]

   url = "http://omdbapi.com/?t=#{@movie}"

  @info = HTTParty.get url

  @movie_info = JSON @info

  erb :form

end

