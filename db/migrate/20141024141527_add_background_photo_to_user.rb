class AddBackgroundPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :background_photo, :string
  end
end
