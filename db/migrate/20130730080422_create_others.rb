class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.integer :stock
      t.integer :reserve
      t.integer :article_id

      t.timestamps
        end
    add_index :others, [:article_id, :created_at]
  end
end
