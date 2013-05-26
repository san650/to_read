class Bookmark < ActiveRecord::Base
  attr_accessible :deleted, :pending, :resource_id, :user_id

  belongs_to :resource
  belongs_to :user
end
