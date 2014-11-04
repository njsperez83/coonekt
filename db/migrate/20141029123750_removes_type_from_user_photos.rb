class RemovesTypeFromUserPhotos < ActiveRecord::Migration
  def change
    remove_column :user_photos, :type
  end
end
