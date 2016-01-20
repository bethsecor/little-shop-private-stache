class Stache < ActiveRecord::Base
  has_many :stache_categories
  has_many :categories, through: :stache_categories
  has_many :order_staches
  has_many :orders, through: :order_staches
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0.0 }
  validates :categories, presence: true
  after_create :default_image

  def status
    if retired?
      "Retired"
    else
      "Active"
    end
  end

  def truncated_description
    description[0..200] + "..."
  end

  private

  def default_image
    if image_url.nil? || image_url.empty?
      self.image_url = "http://i.imgur.com/kMx8J0g.png"
    end
  end
end
