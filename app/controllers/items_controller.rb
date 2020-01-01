class ItemsController < ApplicationController

  # GET: /items
  get "/items" do
    @items = Item.all
    erb :"/items/index"
  end
end
