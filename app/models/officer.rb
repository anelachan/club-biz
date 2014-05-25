# models a club's officer based on details (currently only storing president)
class Officer < ActiveRecord::Base
  belongs_to :registered_club, class_name: "RegisteredClub"

  before_save { self.email = email.downcase }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :position, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
