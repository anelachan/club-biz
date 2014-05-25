class ChangeBackEvent < ActiveRecord::Migration
  def change
  	change_column :events, :start, :datetime
  	change_column :events, :end, :datetime
   	change_column :events, :sales_start, :datetime
  	change_column :events, :sales_end, :datetime
  	remove_column :events, :sales_dt
  	remove_column :events, :end_dt
    remove_column :events, :sales_start_dt
  	remove_column :events, :sales_end_dt
  end
end
