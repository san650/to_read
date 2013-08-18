require "erb"

class AddDescriptionHtmlToResource < ActiveRecord::Migration
  include ERB::Util

  def up
    add_column :resources, :description_html, :text

    Resource.all.each do |resource|
      resource.update_attribute(:description_html, "<p>#{h(resource.description)}</p>")
    end
  end

  def down
    remove_column :resources, :description_html
  end
end
