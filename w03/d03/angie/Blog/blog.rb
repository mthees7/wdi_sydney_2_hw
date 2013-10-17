require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "angiegove", #your progres app username
  :database => "blog",
  :pool => 20
  )

class Post < ActiveRecord::Base # class must have a captial letter
  attr_accessible :title, :body, :image, :category, :created_at
end

before do
  @categories = Post.select(:category).uniq
end


get 'pry' do
  binding.pry
end

get '/'  do
  @posts = Post.order('id desc')

  erb :posts

end

get '/:category' do

    @posts = Post.where( "category = ?",params[:category])
    erb :posts
end


get '/new' do
  erb :new
end

post '/create' do

  post = Post.new
    @post.title = params[:title]
    @post.body = params[:body]
    @post.image = params[:image]
    @post.category = params[:category]
    @post.created_at = Time.now
    @post.save

   redirect '/'

end

get '/:id/edit/' do

  @post = Post.find(params[:id])

  erb :new
end

post '/:id/update' do
    @post = Post.find params[:id]
    @post.title = params[:title]
    @post.body = params[:body]
    @post.image = params[:image]
    @post.category = params[:category]
    @post.created_at = Time.now
    @post.save


  redirect to '/'
end

post '/:id/delete' do

  Post.destroy(params[:id])

  redirect to '/'
end

# get 'posts/:id' do
#   @posts = Post.where(:id => params[:id])
#   if @posts.nil?
#     redirect to '/'
#   end
#   erb :posts
# end








