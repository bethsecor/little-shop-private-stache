class RemovePriceFromStaches < ActiveRecord::Migration
  def change
    remove_column :staches, :price 
  end
end
