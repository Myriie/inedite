class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :article_id
      t.integer :panier_id
      t.integer :quantity

      t.timestamps
    end
	add_index :reservations, :article_id
    add_index :reservations, :panier_id
  end
end
