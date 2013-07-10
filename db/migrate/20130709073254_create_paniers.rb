class CreatePaniers < ActiveRecord::Migration
  def change
    create_table :paniers do |t|
      t.integer :user_id
      t.boolean :validated

      t.timestamps
    end
    add_index :paniers, [:user_id, :created_at]
  end
end