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
    order = current_user.orders.build(user_id: params[:order][:item])
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
    redirect to "/login" unless logged_in?
    @order = Order.find_by(id: params[:id])
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
