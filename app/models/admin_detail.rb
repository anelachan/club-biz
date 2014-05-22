class AdminDetail < ActiveRecord::Base
  belongs_to :admin, class_name: "Admin"
  validates :position,  presence: true
  validates :phone,  presence: true # add better validation

end
