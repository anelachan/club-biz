class AddIndexToRegisteredClubsName < ActiveRecord::Migration
  def change
  	add_index :registered_clubs, :name
  end
end
