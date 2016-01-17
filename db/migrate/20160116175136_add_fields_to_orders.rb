class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :address, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :zipcode, :integer
    add_column :orders, :credit_card_number, :integer
    add_column :orders, :expiration_date, :string
  end
end
