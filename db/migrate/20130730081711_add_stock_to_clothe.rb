class AddStockToClothe < ActiveRecord::Migration
  def change
  	add_column :clothes, :stock, :integer
  	add_column :clothes, :reserve, :integer
  end
end
