class AdNumTicketsToReservations < ActiveRecord::Migration
  def change
  	add_column :ticket_reservations, :num_tickets, :integer
  end
end
