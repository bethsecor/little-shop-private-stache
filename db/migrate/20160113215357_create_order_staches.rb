class CreateOrderStaches < ActiveRecord::Migration
  def change
    create_table :order_staches do |t|
      t.references :order, index: true, foreign_key: true
      t.references :stache, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
