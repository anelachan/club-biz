class Announcement < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
end
