# data stored mainly for our records in case we need to contact the admin.
class AdminDetail < ActiveRecord::Base
  belongs_to :admin, class_name: "Admin"

  validates :position,  presence: true
  MOBILE_REGEX = /^(?:\+?61|0)4 ?(?:(?:[01] ?[0-9]|2 ?[0-57-9]|3 ?[1-9]|4 ?[7-9]|5 ?[018]) ?[0-9]|3 ?0 ?[0-5])(?: ?[0-9]){5}$/
  validates :phone, presence: true, format: { with: MOBILE_REGEX, multiline: true, allow_blank: true} 
end
