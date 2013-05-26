class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :resource_id
      t.boolean :deleted, :default => false
      t.boolean :pending, :default => true

      t.timestamps
    end
  end
end
