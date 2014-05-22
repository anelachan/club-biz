class RegisteredClub < ActiveRecord::Base
  has_many :officers, dependent: :destroy
  has_one :admin_detail
  has_one :admin, through: :admin_detail, dependent: :destroy

  validates :name, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }
end
