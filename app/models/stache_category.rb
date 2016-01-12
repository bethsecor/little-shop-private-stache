class StacheCategory < ActiveRecord::Base
  belongs_to :stache
  belongs_to :category
end
