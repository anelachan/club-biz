class Post < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
  belongs_to :user

end