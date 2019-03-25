class TweetsController < ApplicationController

  get '/tweets' do
    @user = User.find_by(:username => params[:username])
    if !logged_in?
      redirect to '/login'
    else
      erb :'/tweets/tweets'
    end
   end

end
