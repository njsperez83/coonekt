class AddPrimaryFieldToUsersPhotos < ActiveRecord::Migration
  def change
    add_column :users_photos, :primary, :boolean, default: false
    remove_index :users_photos, :column => :type
  end
end
