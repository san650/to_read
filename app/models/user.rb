class User < ActiveRecord::Base
  attr_accessible :name
  has_many :bookmarks, order: 'created_at ASC'
  has_many :resources, through: :bookmarks
end
