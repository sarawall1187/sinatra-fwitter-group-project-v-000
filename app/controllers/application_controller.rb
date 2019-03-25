require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fwitter"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.create(params)
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    if session[:username].empty? || session[:email].empty? || session[:password].empty?
      redirect to '/signup'
    else
    redirect to '/tweets'
   end
  end





end
