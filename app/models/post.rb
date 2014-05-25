# discussion posts attached to an event
# although admins may not post directly on an event page,
# admin announcements also create new Post objects

class Post < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
  belongs_to :user
  default_scope -> {order('created_at DESC')}

  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :event_id, presence: true
end