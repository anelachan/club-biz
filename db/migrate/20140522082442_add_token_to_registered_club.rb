class AddTokenToRegisteredClub < ActiveRecord::Migration
  def change
  	add_column :registered_clubs, :remember_token, :string
  	add_index :registered_clubs, :remember_token
  end
end
