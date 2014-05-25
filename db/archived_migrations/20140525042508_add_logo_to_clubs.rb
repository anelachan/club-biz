class AddLogoToClubs < ActiveRecord::Migration
  def self.up
    add_attachment :clubs, :logo
  end

  def self.down
    remove_attachment :clubs, :logo
  end
end
