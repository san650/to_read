class User < ActiveRecord::Base
  attr_accessible :name
  has_many :bookmarks,
    :dependent  => :destroy,
    :order      => 'created_at ASC',
    :conditions => { :deleted => false, :pending => true }
  has_many :resources, :through => :bookmarks
end
