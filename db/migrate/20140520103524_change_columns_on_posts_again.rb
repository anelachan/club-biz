class ChangeColumnsOnPostsAgain < ActiveRecord::Migration
  def change
  	remove_column :posts, :poster
  	add_column :posts, :user_id, :integer
  end
end
