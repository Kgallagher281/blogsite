require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database, {adapter: 'sqlite3', database: 'blogsite.sqlite3'}

get '/' do 
erb :blog
	
end