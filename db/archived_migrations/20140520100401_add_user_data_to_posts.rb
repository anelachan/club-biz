class AddUserDataToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :user_id
  	add_column :posts, :poster, :string
  end
end
