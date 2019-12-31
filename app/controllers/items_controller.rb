class ItemsController < ApplicationController

  # GET: /items
  get "/items" do
    erb :"/items/index"
  end

  # GET: /items/new
  get "/items/new" do
    erb :"/items/new"
  end

  # POST: /items
  post "/items" do
    redirect "/items"
  end

  # GET: /items/5
  get "/items/:id" do
    erb :"/items/show"
  end

  # GET: /items/5/edit
  get "/items/:id/edit" do
    erb :"/items/edit"
  end

  # PATCH: /items/5
  patch "/items/:id" do
    redirect "/items/:id"
  end

  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    redirect "/items"
  end
end
