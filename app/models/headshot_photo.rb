class HeadshotPhoto < ActiveRecord::Base
  belongs_to :capturable, :polymorphic => true
  after_create :set_user

  def set_user
    user_id = User.current_user
    User.find(user_id).headshot_photos << self
  end
end
