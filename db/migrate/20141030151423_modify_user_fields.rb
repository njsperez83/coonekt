class ModifyUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :background_image
    remove_column :user_photos, :primary
    remove_column :user_photos, :collection_name
    remove_column :users, :favorite_color
  end
end
