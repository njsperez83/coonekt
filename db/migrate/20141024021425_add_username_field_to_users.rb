class AddUsernameFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_index  :users, :user_name

    remove_column :users, :location
    add_column :users, :subregion, :string
  end
end
