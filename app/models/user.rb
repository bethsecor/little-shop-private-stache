class User < ActiveRecord::Base
  has_many :orders
  has_many :headshot_photos, :as => :capturable
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)
  has_secure_password
end
