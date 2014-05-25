class ChangeMessageColumn < ActiveRecord::Migration
  def change
  	rename_column :messages, :sender_id, :club_id
  	add_index :messages, :club_id
  end
end
