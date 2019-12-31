class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :user_id
      t.float :total_price
    end
  end
end
