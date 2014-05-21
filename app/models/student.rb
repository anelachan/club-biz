class Student < User
  has_many :student_clubs
  has_many :clubs, through: :student_clubs
  has_many :ticket_reservations
  has_many :events, through: :ticket_reservations 

  has_many :messages

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

  def joined?(e)
    ticket_reservations.find_by(event_id: e.id)
  end

  def join!(e)
    ticket_reservations.create!(event_id: e.id)
  end

  def add_message!(m)
    user_messages.create!(message_id: m.id)
  end
  
end