require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'matthewthees',
  :password => '',
  :database => "blogs"
  )


#define classes and link comments to post
class Post < ActiveRecord::Base
  attr_accessible :title, :body, :created_at

  def body
    attributes['body'].gsub("\n", "<br>")
  end

  has_many :comments
end


class Comment < ActiveRecord::Base
  attr_accessible :person, :comment

  belongs_to :post
end


#URLs and there corresponding erb file or redirect
get '/' do
  @post = Post.all

  erb :homepage
end



get '/post/new' do

  erb :newpost
end

post '/create' do
  @post = Post.new
  @post.title = params[:title]
  @post.body = params[:body]
  @post.created_at = Time.now

  @post.save
  redirect to '/'
end



get '/post/:id' do
  @post = Post.find(params[:id])

    if @post.nil?
      redirect to '/'
    end

  erb :singlepost
end



get '/post/:id/edit/' do
  @post = Post.find(params[:id])

  erb :postedit
end



post '/update' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.body = params[:body]

  @post.save
  redirect to "/post/#{params[:id]}"
end



post '/post/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect to '/'
end





post '/addcomment' do
  @post = Post.find(params[:post_id])

  @comment = Comment.new
  @comment.person = params[:person]
  @comment.comment = params[:comment]

  @post.comments << @comment

  @post.save

  redirect to "/post/#{params[:post_id]}"
end





post '/post/:post_id/comment/:id/delete' do
  @post = Comment.find(params[:id])
  @post.destroy

  redirect to "/post/#{params[:post_id]}"
end


get '/random' do
  @post = Post.all.sample

  redirect to "/post/#{@post.id}"
end



