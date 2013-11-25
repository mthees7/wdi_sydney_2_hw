require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "nickdoherty",
  :database => "blog",
  :pool => 20
  )

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category, :image, :created_at
  has_many :comments
end

class Comment < ActiveRecord::Base
  attr_accessible :post_id, :comment_body, :comment_title, :author, :created_at
  belongs_to :post
end

before do
  @categories = Post.select(:category).uniq
end

get '/' do
  @posts = Post.order('id desc')

  erb :posts
end

get '/new' do

  erb :new
end

post '/create' do
  post = Post.new
  post.title = params[:title]
  post.body = params[:body]
  post.category = params[:category]
  post.image = params[:image]
  post.save

  redirect to '/'
end

get '/:post_id/edit/' do
  @post = Post.find(params[:post_id])

  erb :new
end

post '/:post_id/update' do
  @post = Post.find(params[:post_id])
  @post.title = params[:title]
  @post.body = params[:body]
  @post.category = params[:category]
  @post.image = params[:image]
  @post.created_at = Time.now
  @post.save

  redirect to '/'
end

post '/:id/delete' do
  Post.destroy(params[:id])

  redirect to '/'
end


get '/:post_id/comments/new' do
  @post = Post.find(params[:post_id])
  erb :comment
end

post '/:post_id/comment/create' do
  post = Post.find(params[:post_id])
  @comment = Comment.new
  @comment.comment_body = params[:comment_body]
  @comment.comment_title = params[:comment_title]
  @comment.author = params[:author]
  @comment.created_at = Time.now
  post.comments << @comment

  redirect to '/'
end

get '/posts/:id' do
  @posts = Post.where(:id => params[:id])
  if @posts.nil?
    redirect to '/'
  end
  erb :posts
end

get '/:category' do
  @posts = Post.where("category = ?", params[:category])

  erb :posts
end
