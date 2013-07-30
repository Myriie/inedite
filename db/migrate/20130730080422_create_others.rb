class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.integer :stock
      t.integer :reserve

      t.timestamps
    end
  end
end
