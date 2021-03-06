class Resource < ActiveRecord::Base
  attr_accessible :link, :description, :description_html
  has_many :bookmarks
  belongs_to :user

  validates :link, :presence => true

  before_validation do
    self.link.strip! unless self.link.nil?
  end

  def self.build_from_text(text)
    link, description = *text.split("\n", 2).map(&:strip)
    html = GitHub::Markdown.render_gfm(description)
    Resource.new(link: link, description: description, description_html: html)
  end
end
