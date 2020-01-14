class UsersController < ApplicationController


  # GET: /users/new
  get "/signup" do
    if logged_in?
      redirect to "/items"
    end
    erb :"/users/signup"
  end

  # POST: /users
  post "/signup" do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "You have successfully created an account."
      redirect to "/orders"
    else
      flash[:error] = user.errors.full_messages
      redirect to "/signup"
    end
    
  end

  

  # DELETE: /users/5/delete
  
end
