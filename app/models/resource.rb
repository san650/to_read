class Resource < ActiveRecord::Base
  attr_accessible :link, :description
  has_many :bookmarks
  belongs_to :user

  validates :link, :presence => true

  before_validation do
    self.link.strip! unless self.link.nil?
  end

  def self.build_from_text(text)
    link, description = *text.split("\n", 2).map(&:strip)
    Resource.new(link: link, description: description)
  end
end
