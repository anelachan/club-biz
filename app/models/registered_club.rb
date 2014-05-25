# a club known as registered by CLUB-BIZ, THE UNIVERSITY
# and by extension the SUPERUSER
class RegisteredClub < ActiveRecord::Base
  has_many :officers, dependent: :destroy
  validates :name, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }
  validates :uni_club_id, numericality: {only_integer: true}, uniqueness: :true
end
