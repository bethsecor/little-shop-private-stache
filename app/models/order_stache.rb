class OrderStache < ActiveRecord::Base
  belongs_to :order
  belongs_to :stache

  validates :quantity, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }
end
