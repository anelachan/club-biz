class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.integer :message_id
      t.integer :recipient_id
      t.timestamps
    end

    add_index :user_messages, :message_id
    add_index :user_messages, :recipient_id
    add_index :user_messages, [:message_id, :recipient_id], unique: true
  end
end
