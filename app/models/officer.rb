class Officer < ActiveRecord::Base
  belongs_to :registered_club, class_name: "RegisteredClub"

  validates :last_name, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :position, presence: true, length: { maximum: 50 }

end
