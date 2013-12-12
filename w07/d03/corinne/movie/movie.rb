# a more robust solution for removing spaces from your URL is to use URI encoding which will also fix other troublesome characters like ? and /
# require 'open-uri'
# url = URI::encode url
# URI::encode 'Oh Brother! Where Art Thou?'
# "Oh%20Brother!%20Where%20Art%20Thou?"


require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  erb :form
end


get '/movies.json' do
  @title = params[:movierequest]
  url = "http://omdbapi.com?t=#{@title}"
  movie = JSON(HTTParty.get url)
  content_type :json
  movie.to_json
end


