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
    # binding.pry
    if !params.empty?
      user = User.create(name: params[:name], email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect to "/items"
    else
      redirect to "/signup"
    end
    
  end

  get "/login" do 
    if logged_in?
      redirect to "/items"
    end
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/items"
    else
      redirect to "/login"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
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
