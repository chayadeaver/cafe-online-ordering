class Item < ActiveRecord::Base
    belongs_to :category
    has_many :items_orders
    has_many :orders, through: :item_orders
end
