class Admin < User 
  has_one :club, foreign_key: "admin_id", dependent: :destroy
  has_many :events, through: :club, dependent: :destroy, source: :club

  def add_club(c)
  	@club = Club.find(c)
  end

  def add_post(p)
    @post = Post.find(p)
  end

end
