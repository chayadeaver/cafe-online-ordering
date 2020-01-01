class ChangeOrderTable < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.remove :item_id
    end
  end
end
