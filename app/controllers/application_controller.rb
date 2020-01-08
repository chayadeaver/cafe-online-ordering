require './config/environment'

# require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "fa7d81c2a752c06ac41043adeaca68576c030aa1c5045e3fbba0446d71546100e6fae8761fec7867c86f84fe74aa6a32cbb376dff085a6e062391e5b8c00eb70"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      @user ||= User.find_by_id(session[:user_id]) 
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect to "/login" unless logged_in?
      flash[:message] = "Please log in to continue"
    end
    
    def redirect_if_not_authorized
      if @order.user != current_user
        flash[:message] = "This is not your order to edit"
        redirect to "/orders"
      end
    end
  end
end
