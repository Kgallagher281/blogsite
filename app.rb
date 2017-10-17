require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

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

post '/signin' do
user = User.find_by(email: params[:email])
if user && user.password == params[:password]
	session[:user_id] = user.id
	flash[:message] = "welcome to BlogHub"
	redirect '/'

else flash[:message] = "Wrong username or password"
	redirect back
end

end