class TweetsController < ApplicationController

  get '/tweets' do
    @user = User.find_by(:username => params[:username])
    if !logged_in?
      redirect to '/login'
    else
      erb :'/tweets/tweets'
    end
   end

   get '/tweets/new' do
     @user = User.find_by(params[:username])
     if logged_in?
       erb :'/tweets/new'
     else
       redirect to '/login'
   end
 end

   post '/tweets' do
     if params[:content].empty?
       redirect to '/tweets/new'
      else
       @tweet = Tweet.create(:content => params[:content])
       @user = User.find_by(params[:username])
       @tweet.user_id = @user.id
       @tweet.save
       erb :'/tweets/show_tweet'
     end
   end

   get '/tweets/:slug' do
     if !logged_in?
       redirect to '/login'
     else
      @tweet = Tweet.find_by(params[:id])
      erb :'/tweets/show_tweet'
    end
  end

  get '/tweets/:slug/edit' do
    if !logged_in?
      redirect to '/login'
    else
      @tweet = Tweet.find_by(params[:id])
      erb :'/tweets/edit_tweet'
    end
  end

   patch '/tweets/:slug' do
     @tweet = Tweet.find_by(params[:slug])
     @tweet.content = params[:content]
     @tweet.save
     redirect to :'/tweets/:slug'
   end




end
