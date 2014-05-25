class AddApprovedBack < ActiveRecord::Migration
  def change
  	add_column :club_groups, :approved, :boolean
  end
end
