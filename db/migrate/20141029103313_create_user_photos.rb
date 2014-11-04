class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.integer :user_id
      t.boolean :primary,         default: false
      t.string  :type,            default: 'none'
      t.string  :collection_name, default: 'none'
      t.string  :image
      t.timestamps
    end
    add_index :user_photos, :user_id
  end
end

