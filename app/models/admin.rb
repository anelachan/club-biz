# those designated to administer a club's page and events by that club
# must be associated with a club that is already registered on Club-Biz
# club belongs to the admin account

class Admin < User 
  has_one :club, foreign_key: "admin_id", dependent: :destroy
  has_many :events, through: :club, dependent: :destroy, source: :club
  has_one :admin_detail

end
