class ModifyFieldToUsersPhotos < ActiveRecord::Migration
  def change
    remove_column :users_photos, :large
    remove_column :users_photos, :small
    add_column :users_photos, :image, :string
  end
end
