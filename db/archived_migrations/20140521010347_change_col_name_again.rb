class ChangeColNameAgain < ActiveRecord::Migration
  def change
  	rename_column :messages, :recipient_id, :student_id
  end
end
