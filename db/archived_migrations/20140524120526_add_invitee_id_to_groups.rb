class AddInviteeIdToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :invitee_id, :integer
  end
end
