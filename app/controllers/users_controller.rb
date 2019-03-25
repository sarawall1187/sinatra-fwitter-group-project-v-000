class UsersController < ApplicationController

      get '/signup' do
        if !logged_in?
          erb :'/users/create_user'
        else
          redirect to '/tweets'
        end
      end

      post '/signup' do
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
          redirect to '/signup'
        else
          # binding.pry
          @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
          session[:user_id] = @user.id
          redirect to '/tweets'
       end
      end

      get '/login' do
        # if !logged_in?
          erb :'/users/login'
        # else
        #   redirect to '/tweets'
        # end
      end

      post '/login' do
        @user = User.find_by(params[:username])
        @user.authenticate(params[:password])
        if @user
        session[:user_id] = @user.id
        redirect to '/tweets'
      else
        redirect to '/login'
      end
    end

end
