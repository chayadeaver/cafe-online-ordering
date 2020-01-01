class RemoveDescriptionFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :description
  end
end
