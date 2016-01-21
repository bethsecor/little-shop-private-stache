class User < ActiveRecord::Base
  has_many :orders
  has_many :headshot_photos, :as => :capturable
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)
  has_secure_password

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(usr)
    Thread.current[:current_user] = usr
  end
end
