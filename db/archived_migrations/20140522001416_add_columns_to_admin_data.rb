class AddColumnsToAdminData < ActiveRecord::Migration
  def change
  	drop_table :admin_data
  end
end
