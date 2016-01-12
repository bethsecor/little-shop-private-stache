class AddImageUrlToStaches < ActiveRecord::Migration
  def change
    add_column :staches, :image_url, :string
  end
end
