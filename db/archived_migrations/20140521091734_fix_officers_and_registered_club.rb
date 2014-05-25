class FixOfficersAndRegisteredClub < ActiveRecord::Migration
  def change
  	remove_column :registered_clubs, :officer_id
  	add_column :officers, :registered_club_id, :integer
  end
end
