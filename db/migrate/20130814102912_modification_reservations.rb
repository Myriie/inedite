class ModificationReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :other_id, :integer
  	add_column :reservations, :clothe_id, :integer

  end

end
