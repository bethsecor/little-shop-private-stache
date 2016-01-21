class HeadshotPhoto < ActiveRecord::Base
  belongs_to :capturable, :polymorphic => true
  after_create :set_user

  def set_user
    User.current_user.headshot_photos << self
  end
end
