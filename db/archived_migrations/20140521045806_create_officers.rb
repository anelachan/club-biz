class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :position

      t.timestamps
    end
  end
end
