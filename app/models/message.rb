class Message < ActiveRecord::Base
  belongs_to :student, class_name: "Student" # as of now can only send club->student :(

end
