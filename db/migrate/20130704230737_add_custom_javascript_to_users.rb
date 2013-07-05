class AddCustomJavascriptToUsers < ActiveRecord::Migration
  def change
    add_column :users, :custom_javascript, :text
  end
end
