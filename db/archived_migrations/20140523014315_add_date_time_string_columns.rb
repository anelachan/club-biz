class AddDateTimeStringColumns < ActiveRecord::Migration
  def change
  	add_column :events, :start_str, :string
  	add_column :events, :end_str, :string
  	add_column :events, :sales_start_str, :string
  	add_column :events, :sales_end_str, :string
  end
end
