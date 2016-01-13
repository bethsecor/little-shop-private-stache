class Stache < ActiveRecord::Base
  has_many :stache_categories
  has_many :categories, through: :stache_categories
  has_many :order_staches
  has_many :orders, through: :order_staches

  def rounded_price
    "%.2f" % price
  end

  def quantity
    order_staches.first.quantity
  end
end
