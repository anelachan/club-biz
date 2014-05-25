class RemovePoster < ActiveRecord::Migration
  def change
  	remove_column :posts, :poster
  end
end
