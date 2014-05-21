class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :content
      t.integer :event_id

      t.timestamps
    end
  end
end
