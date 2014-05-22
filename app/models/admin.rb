class Admin < User 
  has_one :club, foreign_key: "admin_id", dependent: :destroy
  has_many :events, through: :club, dependent: :destroy, source: :club
  has_one :admin_detail

  def add_post(p)
    @post = Post.find(p)
  end

end
