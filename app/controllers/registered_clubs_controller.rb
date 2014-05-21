class RegisteredClubsController < ApplicationController
  def new
  	@registered_club = RegisteredClub.new
  end

  def create
  	@registered_club = RegisteredClub.new(registered_club_params)
  	if @registered_club.save
  	  @officer = @registered_club.officers.build(registered_club_id: @registered_club.id)
  	  render 'show_officers'
  	else
  	  render 'new'
  	end
  end

  def officers
  	render 'show_officers'
  end

  private
  	def registered_club_params
  	  params.require(:registered_club).permit(:name, :uni_club_id)
  	end

end
