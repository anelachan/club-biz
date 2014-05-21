class Verification < ActiveRecord::Base
  validates :name, presence: true
  validates :uni_club_id, presence: true
  validates :president_last_name, presence: true
  validates :president_first_name, presence: true
  validates :president_email, presence: true
end
