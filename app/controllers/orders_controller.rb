class OrdersController < ApplicationController

  # GET: /orders
  get "/orders" do
    redirect_if_not_logged_in
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
      # binding.pry
      redirect "/orders/#{order.id}"
    else
      flash[:message] = "Please try to create your order again."
      redirect "/orders/new"
    end
  end

  # GET: /orders/5
  get "/orders/:id" do
    redirect_if_not_logged_in
    @order = Order.find_by(id: params[:id])
    # binding.pry
    erb :"/orders/show"
  end

  # GET: /orders/5/edit
  get "/orders/:id/edit" do
    redirect_if_not_logged_in
    @order = Order.find_by(id: params[:id])
    @items = Item.all
    redirect_if_not_authorized
      erb :"/orders/edit"
  end

  # PATCH: /orders/5
  patch "/orders/:id" do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @order = Order.find_by(id: params[:id])
    redirect_if_not_authorized
    @order.delete
    redirect "/orders"
  end
end
