class AddAdminIdToClubs < ActiveRecord::Migration
  def change
  	add_column :clubs, :admin_id, :integer
  end
end
