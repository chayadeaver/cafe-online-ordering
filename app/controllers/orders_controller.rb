class OrdersController < ApplicationController

  # GET: /orders
  get "/orders" do
    @orders = current_user.orders
    erb :"/orders/index"
  end

  # GET: /orders/new
  get "/orders/new" do
    @items = Item.all
    if !logged_in?
      redirect to "/signup"
    end
    erb :"/orders/new"
  end

  # POST: /orders
  post "/orders" do
    # binding.pry
    order = current_user.orders.build(item_ids: params[:item_id])
    if order.save
      flash[:message] = "You have successfully created an order."
      redirect "/orders/#{order.id}"
    else
      flash[:message] = "Please try to create your order again."
      redirect "/orders/new"
    end
  end

  # GET: /orders/5
  get "/orders/:id" do
    @items = Item.all
    @order = Order.find_by(params[:id])
    # binding.pry
    erb :"/orders/show"
  end

  # GET: /orders/5/edit
  get "/orders/:id/edit" do
    erb :"/orders/edit"
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
