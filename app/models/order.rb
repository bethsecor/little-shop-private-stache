class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_staches
  has_many :staches, through: :order_staches
end
