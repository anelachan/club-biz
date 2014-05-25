# belongs to an event, sent as a message to all CLUB FOLLOWERS
class Ad < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
  validates :content, presence: true, length: { maximum: 300 }
  validates :event_id, presence: true
end
