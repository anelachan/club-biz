class RemoveRecipientFromMsg < ActiveRecord::Migration
  def change
  	remove_column :messages, :recipient_id
  end
end
