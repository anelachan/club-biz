class Club < ActiveRecord::Base
  has_many :student_clubs, foreign_key: "club_id", dependent: :destroy
  has_many :students, through: :student_clubs, source: :student
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :admin, class_name: "Admin"

  validates :name,  presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 500 }
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*‌​)?$/ix
  validates :website_url, format: { with: VALID_URL_REGEX, multiline: true, allow_blank: true}

  default_scope -> {order('name ASC')}

  def add_event(e)
  	@event = Event.find(e)
  end

end