class HeadshotPhoto < ActiveRecord::Base
  after_create :save_to_user
  belongs_to :capturable, :polymorphic => true

  def save_to_user
    User.current_user.headshot_photos << self
  end
end
