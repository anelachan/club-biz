class RemoveIndexFromAdminDetail < ActiveRecord::Migration
  def change
  	remove_index :admin_details, [:admin_id, :registered_club_id]
  	remove_index :admin_details, :admin_id
  end
end
