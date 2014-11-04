class RemoveFbAvatarFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_path
    add_column :users, :avatar, :string
  end
end
