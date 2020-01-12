class OrdersController < ApplicationController

  # GET: /orders
  get "/orders" do
    redirect_if_not_logged_in
    @orders = current_user.orders
    erb :"/orders/index"
  end

  # GET: /orders/new
  get "/orders/new" do
    redirect_if_not_logged_in
    @items = Item.all
    erb :"/orders/new"
  end

  # POST: /orders
  post "/orders" do
    order = current_user.orders.build(item_ids: params[:item_id])
    if order.save
      flash[:message] = "You have successfully created an order."
      redirect "/orders/#{order.id}"
    else
      flash[:error] = order.errors.full_messages
      redirect "/orders/new"
    end
  end

  # GET: /orders/5
  get "/orders/:id" do
    redirect_if_not_logged_in
    @order = Order.find_by(id: params[:id])
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
      flash[:message] = "You have successfully edited your order."
      redirect to "/orders/#{@order.id}"
    end
    redirect to "/orders"
  end

  # DELETE: /orders/5/delete
  delete "/orders/:id" do
    redirect_if_not_logged_in
    @order = Order.find_by(id: params[:id])
    redirect_if_not_authorized
    @order.destroy
    flash[:message] = "You have successfully deleted your order."
    redirect "/orders"
  end
end
