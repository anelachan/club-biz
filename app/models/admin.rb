class Admin < User 
  has_one :club, foreign_key: "admin_id", dependent: :destroy

  def add_club(c)
  	@club = Club.find(c)
  end

end
