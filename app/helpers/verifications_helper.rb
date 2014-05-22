module VerificationsHelper
  def verified?
  	club_registered? and details_match?
  end

  def club_registered?
  	RegisteredClub.exists?(uni_club_id: @verification.uni_club_id, name: @verification.name)
  end

  def details_match?
  	last_name? and first_name? and email?
  end

  def club
  	club = RegisteredClub.find_by(uni_club_id: @verification.uni_club_id)
  end

  def last_name?
  	club.officers.exists?(position: "President", last_name: @verification.president_last_name)
  end

  def first_name?
  	club.officers.exists?(position: "President", first_name: @verification.president_first_name)
  end

  def email?
  	club.officers.exists?(position: "President", email: @verification.president_email)
  end

  def registered_club
  	RegisteredClub.find_by(uni_club_id: @verification.uni_club_id)
  end
  
end
