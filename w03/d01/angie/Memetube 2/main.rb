require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

get '/' do
  @movies = query_db('SELECT * FROM movies')

  erb :index
end

get '/movies/new' do
  # We're just showing a form here so no need to talk to the database.
  erb :movienew
end

post '/movies/create' do
  # Welcome to SQL quoting hell.
  # Because the 'quotes' around each of our values has a special meaning, we need to
  # 'escape' the quotes within our values by replacing ' with \\' using gsub
  query = "INSERT INTO movies (title, description, url, genre) VALUES ('#{params[:title].gsub(/'/, "\\'")}',
   '#{params[:description].gsub(/'/, "\\'")}', '#{params[:url]}', '#{params[:genre]}')"
  query_db(query)
  redirect to '/'
end

get '/movies/:id/edit' do
  query = "SELECT * FROM movies WHERE id=#{params[:id]}"
  @movie = query_db(query)
  @movie = @movie.first # Remember, exec() returns a collection, even for 1 item.

  erb :movieedit
end

post '/movies/update' do
  # Once again this will be all ruined by any quotes in the values.
  # Horrible unreadable gsub to the rescue again >: |

  query = "UPDATE movies SET title='#{params[:title].gsub(/'/, "\\'")}',
  description='#{params[:description].gsub(/'/, "\\'")}', url='#{params[:url]}', genre='#{params[:genre].gsub(/'/, "\\'")}' WHERE id=#{params[:id]}"
  query_db(query)

  redirect to "/movies/#{params[:id]}"
end

get '/movies/:id/delete' do
  # We don't need quotes around the id because it's numeric and that's okay with SQL
  query = "DELETE FROM movies WHERE id=#{params[:id]}"
  query_db(query)
  redirect to '/'
end

get '/movies/:id' do
  # Gross, we are repeating ourselves.
  @movie = query_db("SELECT * FROM movies WHERE id=#{params[:id]}")
  @movie = @movie.first

  if @movie.nil?
    redirect to '/'
  end

  erb :movieview
end

def query_db(query)
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  result = connection.exec(query)
  connection.close
  result
end