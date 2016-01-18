class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_staches
  has_many :staches, through: :order_staches

  def total
    staches.map { |stache| subtotal(stache) }.sum
  end

  def quantity(stache)
    order_staches.find_by(stache_id: stache.id).quantity
  end

  def subtotal(stache)
    quantity(stache) * stache.price
  end

  def completed?
    %w(completed cancelled).include?(status) ? "Yes" : "No"
  end

  def formatted_created_date
    date = created_at.in_time_zone("Mountain Time (US & Canada)")
    date.strftime("%m/%d/%Y at %I:%M %p")
  end

  def formatted_updated_date
    date = updated_at.in_time_zone("Mountain Time (US & Canada)")
    date.strftime("%m/%d/%Y at %I:%M %p")
  end

  def create_order_staches(cart)
    cart.each do |stache_id, quantity|
      order_staches.create(stache_id: stache_id, quantity: quantity)
    end
  end

  def ordered?
    status == "ordered"
  end

  def paid?
    status == "paid"
  end

  def self.order_status_count
    status_freq = group(:status).count
    %w(ordered paid completed cancelled).each do |status|
      status_freq[status] ||= 0
    end
    status_freq.map { |status, count| [status.capitalize, count] }
  end
end
