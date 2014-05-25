class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :clubs, :name
  	add_index :officers, :last_name
  	add_index :officers, :first_name
  	add_index :officers, :email
  end
end
