class AddUniClubIdToRegistered < ActiveRecord::Migration
  def change
  	add_column :registered_clubs, :uni_club_id, :integer
  	add_index :registered_clubs, :uni_club_id
  end
end
