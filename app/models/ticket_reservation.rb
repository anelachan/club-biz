# stores relationship between Student and Event, and # of tix
# used by Students to see My Events
# used to track ticket sales, viewable in the Admin sales report

class TicketReservation < ActiveRecord::Base
  belongs_to :student, class_name: "Student"
  belongs_to :event, class_name: "Event"
  validates :student, presence: true
  validates :event, presence: true
  validates :num_tickets, presence: true, numericality: {only_integer: true}
end
