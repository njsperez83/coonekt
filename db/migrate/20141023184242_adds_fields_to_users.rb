class AddsFieldsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :work,      :string
    add_column :users, :education, :string
    add_column :users, :interests, :string
    add_column :users, :headline,  :string
    add_column :users, :biography, :text

  end
end
