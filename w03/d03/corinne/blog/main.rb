require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'corinne2', #your postgres.app username
  :password => '',
  :database => "blogs",
  :pool => 20
)

class Post <ActiveRecord::Base
  attr_accessible :title, :body

  def body
    attributes['body'].gsub("\n", "<br>")
  end

end



get '/' do
  @posts = Post.all
  erb :posts
end


get '/posts/new' do
  erb :new
end


get '/posts' do
  @posts = Post.all
  erb :posts
end


post '/create' do
  post = Post.new
  post.title = params[:title]
  post.body = params[:body]
  post.save
  redirect to '/'
end


get '/posts/:id/edit/' do
  @post = Post.find(params[:id])
  erb :new
end


post '/posts/:id' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.body = params[:body]
  post.save
  redirect to '/'
end


post '/posts/:id/delete' do
  Post.destroy(params[:id])
  redirect to '/'
end


get '/posts/:id' do
  @posts = Post.where(:id => params[:id])
  if @posts.nil?
    redirect to '/'
  end
  erb :posts
end


