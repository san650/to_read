class Resource < ActiveRecord::Base
  attr_accessible :link
  has_many :bookmarks

  validates :link, :presence => true
  before_validation :trim_link

  after_create :assign_link_to_everyone

  private

  def trim_link
    @link.strip! unless @link.nil?
  end

  def assign_link_to_everyone
    User.all.each do |user|
      user.bookmarks.create({
        :resource_id => id,
        :user_id     => user.id
      })
    end
  end
end
