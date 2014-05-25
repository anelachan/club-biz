class AddApprovalToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :approved, :boolean
  	remove_column :club_groups, :approved
  end
end
