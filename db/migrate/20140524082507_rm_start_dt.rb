class RmStartDt < ActiveRecord::Migration
  def change
  	remove_column :events, :start_dt
  end
end
