class AddColumnsToRegisteredClub < ActiveRecord::Migration
  def change
  	add_column :registered_clubs, :admin_id, :integer
  end
end
