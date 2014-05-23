class Post < ActiveRecord::Base
  belongs_to :event, class_name: "Event"
  belongs_to :user
  default_scope -> {order('created_at DESC')}

end