class CreateRegisteredClubs < ActiveRecord::Migration
  def change
    create_table :registered_clubs do |t|
      t.string :name
      t.integer :officer_id

      t.timestamps
    end
    add_index :registered_clubs, :officer_id
  end
end
