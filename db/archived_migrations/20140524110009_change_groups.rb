class ChangeGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :invited, :boolean
  end
end
