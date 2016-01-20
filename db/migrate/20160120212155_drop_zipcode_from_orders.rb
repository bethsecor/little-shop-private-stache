class DropZipcodeFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :zipcode
  end
end
