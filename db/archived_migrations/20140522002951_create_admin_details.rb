class CreateAdminDetails < ActiveRecord::Migration
  def change
    create_table :admin_details do |t|
      t.string :position
      t.string :phone
      t.integer :admin_id

      t.timestamps
    end
  end
end
