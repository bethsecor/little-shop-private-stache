class AddUserIdToHeadshotPhotos < ActiveRecord::Migration
  def change
    add_column :headshot_photos, :user_id, :integer
  end
end
