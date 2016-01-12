class Stache < ActiveRecord::Base

  def rounded_price
    "%.2f" % price
  end
end
