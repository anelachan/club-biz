# admins may post announcements through the announcement tool
# an announcement spawns a Post in the Event's Post feed 
# and a message to all attendees (those who have reserved tickets)

class Announcement < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
  validates :content, presence: true, length: { maximum: 300 }
end
