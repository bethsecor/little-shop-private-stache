class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_staches
  has_many :staches, through: :order_staches

  def total
    staches.map { |stache| stache.subtotal_num }.sum
  end

  def completed?
    ["completed", "cancelled"].include?(status) ? "Yes" : "No"
  end
end
