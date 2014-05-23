class Message < ActiveRecord::Base
  belongs_to :student, class_name: "Student" # as of now can only send club->student :(
  belongs_to :club, class_name: "Club"
  default_scope -> {order('created_at DESC')}
end
