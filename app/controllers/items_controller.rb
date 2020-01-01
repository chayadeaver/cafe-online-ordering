class ItemsController < ApplicationController

  # GET: /items
  get "/items" do
    if logged_in?
    @items = Item.all
    erb :"/items/index"
    else 
      redirect to "/users/login"
    end
  end
end
