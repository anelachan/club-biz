class UserMessage < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :message, class_name: "Message"
  validates :message, presence: true
  validates :user, presence: true

end
