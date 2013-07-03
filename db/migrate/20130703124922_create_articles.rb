class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :id
      t.string :title
      t.text :description
      t.float :price
      t.string :type

      t.timestamps
    end
  end
end
