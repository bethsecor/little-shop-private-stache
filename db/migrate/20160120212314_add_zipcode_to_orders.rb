class AddZipcodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :zipcode, :string
  end
end
