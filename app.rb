require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database, {adapter: 'sqlite3', database: 'blogsite.sqlite3'}
get '/' do
  erb :blog
  
end

get '/post' do
	erb :post
end

get '/account' do
	erb :account
end

get '/signout' do
	erb :signout
end

get'/contact' do
	erb :contact
end