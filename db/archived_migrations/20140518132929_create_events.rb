class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.text :description
      t.decimal :ticket_price
      t.integer :initial_tickets_avail
      t.text :ticket_purchase_instructions
      t.datetime :sales_start
      t.datetime :sales_end
      t.text :conditions
      t.string :website_URL

      t.timestamps
    end
  end
end
