class Event < ActiveRecord::Base
  belongs_to :club, class_name: "Club"
  has_many :ticket_reservations, foreign_key: "event_id", dependent: :destroy
  has_many :students, through: :ticket_reservations, source: :student
  has_many :posts, foreign_key: "event_id", dependent: :destroy
  has_many :ads, foreign_key: "event_id", dependent: :destroy
  has_many :announcements, foreign_key: "event_id", dependent: :destroy

  validates :name, presence:true
  validates :start, presence:true # ADD BETTER VALIDATION
  validates :end, presence:true
  validates :location, presence:true
  validates :description, presence:true # min length?
  validates :ticket_price, presence:true
  validates :initial_tickets_avail, presence:true
  validates :ticket_purchase_instructions, presence:true
  validates :sales_start, presence:true
  validates :sales_end, presence:true
  validates :conditions, presence:true

  def add_post(p) #delete?
    @post = Post.find(p)
  end

  def start_has_time
  end

  def end_has_time
  end

  def sales_start_has_time
  end

  def sales_end_has_time
  end

  def start_valid
  end

  def end_valid
  end

  def sales_start_valid
  end

  def sales_end_valid
  end

end
