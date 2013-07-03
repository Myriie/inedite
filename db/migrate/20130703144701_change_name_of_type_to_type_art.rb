class ChangeNameOfTypeToTypeArt < ActiveRecord::Migration
  def change
  	rename_column :articles, :type, :type_art
  end

end
