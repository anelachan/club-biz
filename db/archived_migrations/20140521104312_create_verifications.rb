class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.string :name
      t.integer :uni_club_id
      t.string :president_last_name
      t.string :president_first_name
      t.string :president_email

      t.timestamps
    end
  end
end
