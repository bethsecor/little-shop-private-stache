class AddFieldToStaches < ActiveRecord::Migration
  def change
    add_column :staches, :retired, :boolean, default: false
  end
end
