class Student < User
  has_many :student_clubs
  has_many :clubs, through: :student_clubs
  def self.table_name_prefix
    'student_'
  end

  def following?(c)
    student_clubs.find_by(club_id: c.id)
  end

  def follow!(c)
  	student_clubs.create!(club_id: c.id)
  end

  def unfollow!(c)
  	student_clubs.find_by(club_id: c.id).destroy
  end
  
end