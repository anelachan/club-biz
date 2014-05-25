class ChangeEventDtColumns < ActiveRecord::Migration
  def change
  	change_column :events, :start, :string
  	change_column :events, :end, :string
  	change_column :events, :sales_start, :string
  	change_column :events, :sales_end, :string

  	add_column :events, :start_dt, :datetime
  	add_column :events, :end_dt, :datetime
  	add_column :events, :sales_start_dt, :datetime
  	add_column :events, :sales_end_dt, :datetime
  end
end
