class CreateTicketReservations < ActiveRecord::Migration
  def change
    create_table :ticket_reservations do |t|
      t.integer :student_id
      t.integer :event_id

      t.timestamps
    end

  add_index :ticket_reservations, :student_id
  add_index :ticket_reservations, :event_id
  add_index :ticket_reservations, [:student_id, :event_id], unique: true
  end
end
