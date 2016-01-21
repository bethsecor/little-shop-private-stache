class HeadshotPhoto < ActiveRecord::Base
  belongs_to :capturable, :polymorphic => true
end
