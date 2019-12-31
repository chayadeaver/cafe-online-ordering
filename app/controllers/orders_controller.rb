class OrdersController < ApplicationController

  # GET: /orders
  get "/orders" do
    erb :"/orders/index.html"
  end

  # GET: /orders/new
  get "/orders/new" do
    erb :"/orders/new.html"
  end

  # POST: /orders
  post "/orders" do
    redirect "/orders"
  end

  # GET: /orders/5
  get "/orders/:id" do
    erb :"/orders/show.html"
  end

  # GET: /orders/5/edit
  get "/orders/:id/edit" do
    erb :"/orders/edit.html"
  end

  # PATCH: /orders/5
  patch "/orders/:id" do
    redirect "/orders/:id"
  end

  # DELETE: /orders/5/delete
  delete "/orders/:id/delete" do
    redirect "/orders"
  end
end
