class DropUserMessages < ActiveRecord::Migration
  def change
  	drop_table :user_messages
  end
end
