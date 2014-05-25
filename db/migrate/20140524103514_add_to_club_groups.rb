class AddToClubGroups < ActiveRecord::Migration
  def change
  	add_column :club_groups, :club_id, :integer
  	add_column :club_groups, :group_id, :integer
  end
end
