class Order < ActiveRecord::Base
    belongs_to :user
    has_many :item_orders
    has_many :items, through: :item_orders

    def total_price
        self.items.sum("price")
    end
end
