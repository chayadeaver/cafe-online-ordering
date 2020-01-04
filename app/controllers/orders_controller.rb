class OrdersController < ApplicationController

  # GET: /orders
  get "/orders" do
    redirect to "/login" unless logged_in?
    @orders = current_user.orders
    erb :"/orders/index"
  end

  # GET: /orders/new
  get "/orders/new" do
    redirect to "/login" unless logged_in?
    @items = Item.all
    erb :"/orders/new"
  end

  # POST: /orders
  post "/orders" do
    # binding.pry
    
    order = current_user.orders.build(item_ids: params[:item_id])
    
    if order.save
      flash[:message] = "You have successfully created an order."
      # binding.pry
      redirect "/orders/#{order.id}"
    else
      # binding.pry
      flash[:message] = order.errors.full_messages
      redirect "/orders/new"
    end
  end

  # GET: /orders/5
  get "/orders/:id" do
    redirect to "/login" unless logged_in?
    @order = Order.find_by(id: params[:id])
    # binding.pry
    erb :"/orders/show"
  end

  # GET: /orders/5/edit
  get "/orders/:id/edit" do
    redirect to "/login" unless logged_in?
    @order = Order.find_by(id: params[:id])
    @items = Item.all
    redirect_if_not_authorized
      erb :"/orders/edit"
  end

  # PATCH: /orders/5
  patch "/orders/:id" do
    redirect to "/login" unless logged_in?
    @order = Order.find_by(id: params[:id])
    redirect_if_not_authorized
    if @order.update(item_ids: params[:item_id])
      @order.save
      redirect to "/orders/:id"
    end
    redirect to "/orders"
  end

  # DELETE: /orders/5/delete
  delete "/orders/:id" do
    redirect to "/login" unless logged_in?
    @order = Order.find_by(id: params[:id])
    redirect_if_not_authorized
    @order.destroy
    # binding.pry
    redirect "/orders"
  end
end
