# messages sent through the Club-Biz system
# ads and announcements are also replicated as messages
# as of now can only send club->student
class Message < ActiveRecord::Base
  belongs_to :student, class_name: "Student" 
  belongs_to :club, class_name: "Club"
  default_scope -> {order('created_at DESC')}  
end
