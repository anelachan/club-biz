# a link table between Student and Club to enable the "following" relationship
class StudentClub < ActiveRecord::Base
	belongs_to :student, class_name: "Student"
	belongs_to :club, class_name: "Club"
	validates :student, presence: true
	validates :club, presence:true
end