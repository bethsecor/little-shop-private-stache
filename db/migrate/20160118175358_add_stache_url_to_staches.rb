class AddStacheUrlToStaches < ActiveRecord::Migration
  def change
    add_column :staches, :stache_url, :string
  end
end
