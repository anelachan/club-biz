class RegisteredClubsController < ApplicationController
  def new
  	@registered_club = RegisteredClub.new
  	@president = Officer.new
  	@treasurer = Officer.new
  end

  def create
  	# create a new object
  	# build two officer objects
  	# save that shit
  end

  private
  	def registered_club_params
  	  params.require(:registered_club).permit(:name)
  	end

end
