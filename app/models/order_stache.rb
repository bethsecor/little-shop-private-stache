class OrderStache < ActiveRecord::Base
  belongs_to :order
  belongs_to :stache
end
