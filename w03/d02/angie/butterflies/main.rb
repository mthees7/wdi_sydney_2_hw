require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do
  sql = "SELECT DISTINCT family, COUNT(*) AS count FROM butterflies GROUP BY family"
  @nav_rows = query_sql(sql)
end

get '/' do
  # home erb
  erb :home
end



get '/butterflies/:butterfly_id/edit/' do
  # string to store SQL to find a butterfly
  # execute the SQL
  # @row to store the result of SQL query
  # render new erb
  sql ="SELECT * FROM butterflies WHERE id=#{params[:butterfly_id]}"
  @row = query_sql(sql)
  @row = @row.first

  # @butterfly = @butterfly.first # Remember, exec() returns a collection, even for 1 item.

  erb :new
end



post '/butterflies/:butterfly_id/delete' do
  # string to store SQL to delete a butterfly
  # execute the SQL
  # go back to /butterflies
   sql = "DELETE FROM butterflies WHERE id= #{params[:butterfly_id]}"
  query_sql(sql)

  redirect to '/butterflies'
end

get '/butterflies/new' do
  # new erb
  erb :new
end

post '/butterflies/:butterfly_id/update' do
  # Once again this will be all ruined by any quotes in the values.
  # Horrible unreadable gsub to the rescue again >: |
 #  sql = "UPDATE butterflies SET name='#{params[:name].gsub(/'/, "\\'")}',
 #  family='#{params[:family].gsub(/'/, "\\'")}', photo='#{params[:photo]}' WHERE id='#{params[:butterfly_id]}'"

 # query_sql(sql)

 post '/butterflies/:butterfly_id/update' do
  query = "UPDATE butterflies SET name='#{params[:name]}', family='#{params[:family]}', image='#{params[:image]}' WHERE id=#{params[:butterfly_id]}"
  query_sql(query)
  redirect to '/butterflies'
end

  redirect to '/butterflies'
end

post '/butterflies/:butterfly_id' do
  # string to store SQL to update a butterfly
  # execute the SQL
  # go back to /butterflies
   @row = query_sql("SELECT * FROM butterflies WHERE id= '#{params[:butterfly_id]}'")
   @row = @row.first
     @row

  redirect to '/butterflies'
end

get '/butterflies/:family' do
  # string to store SQL query for a given family
  # @rows to store the result of SQL query
  # families erb

  sql ="SELECT * FROM butterflies WHERE family= '#{params[:family]}'"
  @rows = query_sql(sql)

  erb :butterflies
end

get '/butterflies' do
  # string to store SQL query for all butterflies
  # @rows to store the result of SQL query
  # render butterflies erb
    sql = 'SELECT * FROM butterflies ORDER BY id DESC'
    @rows = query_sql(sql)
  #  sql = "INSERT INTO butterflies (name, family, photo) VALUES ('#{params[:name].gsub(/'/, "\\'")}',
  #   '#{params[:family].gsub(/'/, "\\'")}', '#{params[:photo]}')"
  # @rows = query_sql(sql)

  erb :butterflies
end

post '/create' do
  # string of SQL that will write to db
  # write to db
  # back to /butterflies
   sql = "INSERT INTO butterflies (name, family, photo) VALUES ('#{params[:name].gsub(/'/, "\\'")}',
    '#{params[:family].gsub(/'/, "\\'")}', '#{params[:photo]}')"
  query_sql(sql)

  redirect to '/butterflies'
end

def query_sql(sql)
  # connect to butterfliesdb
  # execute the SQL in the argument
  # close db connection
  # return the result of SQL query
  connection = PG.connect(:dbname => 'butterflies', :host => 'localhost')
  result = connection.exec(sql)
  connection.close
  result
end
