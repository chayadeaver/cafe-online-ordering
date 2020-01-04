class Order < ActiveRecord::Base
    belongs_to :user
    has_many :item_orders, dependent: :destroy
    has_many :items, through: :item_orders
    validates :items, presence: true

    def total_price
        self.items.sum("price")
    end
end
