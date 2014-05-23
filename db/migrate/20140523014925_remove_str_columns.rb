class RemoveStrColumns < ActiveRecord::Migration
  def change
  	remove_column :events, :start_str
  	remove_column :events, :end_str
  	remove_column :events, :sales_start_str
  	remove_column :events, :sales_end_str
  end
end
