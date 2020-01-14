class SessionsController < ApplicationController
    get "/login" do 
        if logged_in?
        redirect to "/"
        end
        erb :"/users/login"
    end
    
    post "/login" do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash.next[:message] = "You are successfully logged in."
            redirect to "/"
        else
            if !user
                user = User.new(email: params[:email], password: params[:password])
                user.valid?
            end
        flash[:error] = user.errors.full_messages
        redirect to "/login"
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            flash[:message] = "You have successfully logged out. Have a nice day!"
        else
            redirect to "/"
        end
        redirect "/login"
    end

end