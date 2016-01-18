class Staches < ActiveRecord::Migration
  def change
    add_column :staches, :price, :decimal, :percision => 8, :scale => 2
  end
end
