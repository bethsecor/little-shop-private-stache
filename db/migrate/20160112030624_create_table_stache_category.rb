class CreateTableStacheCategory < ActiveRecord::Migration
  def change
    create_table :stache_categories do |t|
      t.integer :stache_id
      t.integer :category_id
    end
  end
end
