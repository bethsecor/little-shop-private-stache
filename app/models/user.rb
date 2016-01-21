class User < ActiveRecord::Base
  has_many :orders
  has_many :headshot_photos, :as => :capturable
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)
  has_secure_password

  def self.current_user
    Thread.current[:user_id]
  end

  def self.current_user=(user_id)
    Thread.current[:user_id] = user_id
  end
end
