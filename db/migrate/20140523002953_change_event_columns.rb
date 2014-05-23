class ChangeEventColumns < ActiveRecord::Migration
  def change
  	remove_column :events, :date
  	add_column :events, :start, :datetime
  	add_column :events, :end, :datetime
  end
end
