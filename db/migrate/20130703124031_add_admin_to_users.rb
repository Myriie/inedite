class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :adresse, :text
  end
end
