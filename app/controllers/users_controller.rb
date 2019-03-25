class UsersController < ApplicationController



  get '/login' do

  end

  post '/login' do
    @user = User.find(params[:id])
    #session hash somewhere in here
    redirect to '/tweets/tweets.erb'
  end

end
