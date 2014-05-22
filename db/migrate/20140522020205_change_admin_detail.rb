class ChangeAdminDetail < ActiveRecord::Migration
  def change
  	add_column :admin_details, :registered_club_id, :integer
  	add_column :admin_details, :last_name, :string
  	add_column :admin_details, :first_name, :string
  	add_column :admin_details, :email, :string
  	add_column :admin_details, :password_digest, :string

  	add_index :admin_details, :registered_club_id
  	add_index :admin_details, :admin_id
  	add_index :admin_details, [:admin_id, :registered_club_id], unique: true
  end
end
