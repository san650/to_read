class UpdateLinkFromResources < ActiveRecord::Migration
  def up
    change_column :resources, :link, :text
  end

  def down
    change_column :resources, :link, :string
  end
end
