class CreateStudentClubs < ActiveRecord::Migration
  def change
    create_table :student_clubs do |t|
      t.integer :student_id
      t.integer :club_id

      t.timestamps
    end

  add_index :student_clubs, :student_id
  add_index :student_clubs, :club_id
  add_index :student_clubs, [:student_id, :club_id], unique: true
  end
end
