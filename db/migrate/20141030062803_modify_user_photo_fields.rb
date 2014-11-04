class ModifyUserPhotoFields < ActiveRecord::Migration
  def change
    remove_column :user_photos, :image
    add_column :user_photos, :large, :string
    add_column :user_photos, :small, :string
  end
end
