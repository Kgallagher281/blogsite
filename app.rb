require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'blogsite.sqlite3'}

 before do
 	current_user
end

get '/profile' do
	erb :profile
end

get '/' do
  erb :blog
end

get '/post' do
	erb :post
end

get '/editaccount' do
	erb :editaccount
end

get '/signout' do
	erb :signout
end

get'/contact' do
	erb :contact
end
get '/home' do
	erb :home
end

post '/home' do
user = User.find_by(email: params[:email])
if user && user.password == params[:password]
	session[:user_id] = user.id
	flash[:message] = "welcome to BlogHub"
	redirect '/home'

else flash[:message] = "Wrong username or password"
	redirect back
end
end


post '/editaccount' do
user = User.create(email: params[:email], first: params[:first], last: params[:last], password: params[:password])
	session[:user_id] = user.id
	redirect '/account'

end

post '/profile' do
	p "..in profile: #{@current_user}"
	Profile.create(group: params[:group], position: params[:position], birth: params[:birth], about_me: params[:about_me], 	user_id: @current_user.id)
	redirect back
end

get "/profile" do
    erb :profile
end
post "/profile/update" do
    @profile = @current_user.profile  
    @profile.update(
        group: params[:group],
        position: params[:position],
        birth: params[:birth],
        about_me: params[:about_me]
        )
    redirect'/profile'
 end


def current_user
	@current_user = User.find(session[:user_id]) if session[:user_id]
	p "current_user #{@current_user}"
	@current_user
end

