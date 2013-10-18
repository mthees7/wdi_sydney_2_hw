require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/multiply/:x/:y'  do
  @x = params[:x].to_f
  @y = params[:y].to_f
  @operation = 'multiply'

  @result = params[:x].to_f * params[:y].to_f
  erb:calc
end

get '/divide/:x/:y' do
  @x = params[:x].to_f
  @y = params[:y].to_f
  @operation = 'divide'

  @result = @x / @y
  erb:calc
end

get '/subtract/:x/:y' do
  @x = params[:x].to_f
  @y = params[:y].to_f

  @result = @x - @y
  erb:calc
end

get '/add/:x/:y' do
  @x = params[:x].to_f
  @y = params[:y].to_f

  @result = @x + @y
  erb:calc
end

get '/' do
  erb:form
end

get '/calc' do
  # binding.pry
  @first = params[:first].to_f
  @second = params[:second].to_f

  @result = case params[:operator]
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end

erb :calc
end

get '/about' do
  erb:about
end