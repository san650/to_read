class AddContentTypeToResource < ActiveRecord::Migration
  def down
    remove_column :resources, :content_type
  end

  def up
    add_column :resources, :content_type, :string
    Resource.all.each do |res|
      res.update_attribute(
        :content_type,
        Metadata.content_type(res.link)
      )
    end
  end
end
