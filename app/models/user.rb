class User < ActiveRecord::Base
  has_many :headshot_photos, :as => :capturable
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
