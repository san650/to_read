class Bookmark < ActiveRecord::Base
  attr_accessible :deleted, :pending, :resource_id, :user_id

  belongs_to :resource
  belongs_to :user

  def self.descending
    order("created_at DESC")
  end

  def self.ascending
    order("created_at ASC")
  end
end
