class ChangeAdminDetailsAgain < ActiveRecord::Migration
  def change
  	remove_column :admin_details, :registered_club_id
  	remove_column :admin_details, :last_name
  	remove_column :admin_details, :first_name
  	remove_column :admin_details, :email
  	remove_column :admin_details, :password_digest

  	add_index :admin_details, :admin_id
  end
end
