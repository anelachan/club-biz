class MoveRememberTokenFromRegisteredToVerification < ActiveRecord::Migration
  def change
  	add_column :verifications, :remember_token, :string
  	remove_column :registered_clubs, :remember_token
  end
end
