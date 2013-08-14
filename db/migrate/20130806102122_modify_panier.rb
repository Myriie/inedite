class ModifyPanier < ActiveRecord::Migration
  def change
  	add_column :reservations, :product_id, :integer
  	add_column :reservations, :product_type, :string
  end
end
