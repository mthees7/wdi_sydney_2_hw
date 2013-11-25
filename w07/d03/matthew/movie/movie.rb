require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'


get '/movie' do

  erb :form
end

get '/movie.json' do
  @movie = params[:title].gsub(/[' ']/, '%20') if params[:title]

  url = "http://omdbapi.com/?t=#{ @movie }"

  @info = HTTParty.get url
  @movie = JSON @info

# what the hell is going on below here?

  content_type :json
  result = {
    :movie => @movie
  }

  result.to_json
end



