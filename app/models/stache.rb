class Stache < ActiveRecord::Base
  has_many :stache_categories
  has_many :categories, through: :stache_categories
  
  def rounded_price
    "%.2f" % price
  end
end
