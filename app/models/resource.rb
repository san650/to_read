require 'net/http'

class Resource < ActiveRecord::Base
  attr_accessible :link, :description, :description_html, :content_type

  has_many :bookmarks
  belongs_to :user

  validates :link, :presence => true

  before_validation do
    self.link.strip! unless self.link.nil?
  end

  before_create :inspect_resource

  def self.build_from_text(text)
    link, description = *text.split("\n", 2).map(&:strip)
    html = GitHub::Markdown.render_gfm(description)
    Resource.new(link: link, description: description, description_html: html)
  end

  private

  def inspect_resource
    self.content_type = Metadata.content_type(link)
  end
end
