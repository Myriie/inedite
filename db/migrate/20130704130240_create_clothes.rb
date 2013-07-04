class CreateClothes < ActiveRecord::Migration
  def change
    create_table :clothes do |t|
      t.string :size
      t.string :color
      t.integer :article_id

      t.timestamps
    end
    add_index :clothes, [:article_id, :created_at]
  end
end