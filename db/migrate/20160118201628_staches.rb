class Staches < ActiveRecord::Migration
  def change
    add_column :staches, :price, :decimal, precision: 8, scale: 2
  end
end
