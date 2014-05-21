class Event < ActiveRecord::Base
  belongs_to :club, class_name: "Club"
  has_many :ticket_reservations, foreign_key: "event_id", dependent: :destroy
  has_many :students, through: :ticket_reservations, source: :student
  has_many :posts, foreign_key: "event_id", dependent: :destroy
  has_many :ads, foreign_key: "event_id", dependent: :destroy


  validates :name, presence:true
  validates :date, presence:true

  validates :start_time, presence:true # ADD BETTER VALIDATION
  validates :end_time, presence:true
  validates :location, presence:true
  validates :description, presence:true # min length?
  validates :ticket_price, presence:true
  validates :initial_tickets_avail, presence:true
  validates :ticket_purchase_instructions, presence:true
  validates :sales_start, presence:true
  validates :sales_end, presence:true
  validates :conditions, presence:true

  def add_post(p)
    @post = Post.find(p)
  end

end
