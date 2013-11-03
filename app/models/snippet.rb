class Snippet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :html, :raw, :title, :user

  def self.build_from_text(text, current_user)
    title, snippet = *text.split("\n", 2).map(&:strip)
    html = GitHub::Markdown.render_gfm(snippet)
    Snippet.new(title: title, raw: text, html: html, user: current_user)
  end
end
