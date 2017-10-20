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
	erb :profile, locals:{user: @current_user}
end

get '/profile/:id' do
  @post = Post.all
end

get '/' do
  erb :blog
end

get'/createposts' do
	erb :createposts
end 

get '/editaccount' do
	erb :editaccount
end

get '/signout' do
	session[:user_id] = nil
	redirect'/'
	erb :signout
end

get'/contact' do
	erb :contact
end
get '/home' do
	@posts = Post.all
	@users = User.all
	erb :home
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :profile, locals: {user: @user}
end



post '/contact' do
	erb :contact
	redirect '/home'
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

get '/home' do 
	@users= User.all
	@posts = Post.all
	erb :home
end

post '/editaccount' do
	user = User.create(email: params[:email], first: params[:first], last: params[:last], password: params[:password])
	session[:user_id] = user.id
	redirect '/editaccount'

end

post '/profile' do
	p "..in profile: #{@current_user}"
	Profile.create(group: params[:group], position: params[:position], birth: params[:birth], about_me: params[:about_me], 	user_id: @current_user.id)
	redirect back
end

post "/createposts" do
	# params.to_s
post = Post.create(genre: params[:genre], title: params[:title], body: params[:body], url: params[:url], user_id: @current_user.id)
redirect "/home"

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


post '/deleteaccount' do
	@current_user
	User.transaction do
		@current_user.reviews.destroy_all
		@current_user.posts.each do |post|
			post.reviews.destroy_all
		end
		@current_user.destroy
		session[:user_id] =nil
	end
	redirect'/'
end

def current_user
	@current_user = User.find(session[:user_id]) if session[:user_id]
	p "current_user #{@current_user}"
	@current_user
end


