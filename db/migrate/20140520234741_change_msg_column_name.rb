class ChangeMsgColumnName < ActiveRecord::Migration
  def change
  	rename_column :user_messages, :recipient_id, :user_id
  end

end
