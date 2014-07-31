# stores details for a club profile
# club cannot exist without an admin (for Club-Biz)
# can be followed by students

class Club < ActiveRecord::Base
  belongs_to :admin, class_name: "Admin"
  has_many :student_clubs, foreign_key: "club_id", dependent: :destroy
  has_many :students, through: :student_clubs, source: :student
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_attached_file :logo, styles: {thumb: "100x100#"}, default_url: "/images/:style/missing.png"
  validates_attachment :logo, presence: true, 
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, 
    size: {in: 0..500.kilobytes}

  validates :name,  presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 500 }
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*‌​)?$/ix
  validates :website_url, format: { with: VALID_URL_REGEX, multiline: true, allow_blank: true}
  
  
  default_scope -> {order('name ASC')}

  def add_event(e)
  	@event = Event.find(e)
  end

  def add_group(g)
    club_groups.create!(group_id: g.id)
  end


end