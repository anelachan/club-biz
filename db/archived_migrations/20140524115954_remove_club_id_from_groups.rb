class RemoveClubIdFromGroups < ActiveRecord::Migration
  def change
  	remove_column :groups, :club_id
  end
end
