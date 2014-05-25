class AddClubIdToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :club_id, :integer
  end
end
