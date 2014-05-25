class RemoveGroupTables < ActiveRecord::Migration
  def change
  	drop_table :club_groups
  	drop_table :groups
  end
end
