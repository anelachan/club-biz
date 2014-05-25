class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :content
      t.integer :event_id

      t.timestamps
    end
  end
end
