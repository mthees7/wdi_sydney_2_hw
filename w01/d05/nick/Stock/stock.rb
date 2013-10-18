require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'YahooFinance'

get '/' do
  erb:form
end

get '/stock' do
  @stockcode = params[:stock]
  @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @stockcode)[@stockcode].lastTrade
  erb:stock
end