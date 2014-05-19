class CreateStudentUsers < ActiveRecord::Migration
  def change
    create_table :student_users do |t|

      t.timestamps
    end
  end
end
