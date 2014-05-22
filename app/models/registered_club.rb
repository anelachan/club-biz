class RegisteredClub < ActiveRecord::Base
  has_many :officers, dependent: :destroy
  validates :name, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }

end
