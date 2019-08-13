require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    if @user
      session[:user_id] = @user.id
      redirect to "/account"
    end
  end

  get '/account' do
    @balance = @user.balance
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
