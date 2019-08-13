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
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    if Helpers.is_logged_in?(session)
      redirect to "/account"
    else
      erb :error
    end
  end

  get '/account' do
    @user = Helpers.current_user.username
    @balance = Helpers.current_user.balance
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
