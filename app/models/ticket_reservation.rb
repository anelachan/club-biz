class TicketReservation < ActiveRecord::Base
  belongs_to :student, class_name: "Student"
  belongs_to :event, class_name: "Event"
  validates :student, presence: true
  validates :event, presence: true
end
