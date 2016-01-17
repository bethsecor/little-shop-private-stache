class RemoveFieldsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :credit_card_number, :string
    remove_column :orders, :expiration_date, :string
  end
end
