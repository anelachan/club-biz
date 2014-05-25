class OfficersController < ApplicationController

  def create # accessible through registered_club/show_officers
  	@registered_club = RegisteredClub.find(params[:officer][:registered_club_id])
  	@officer = @registered_club.officers.build(officer_params)
  	@officer.position = "President" # currently only adding president
  	if @officer.save
  	  flash[:success] = "Club added to database."
  	else
  	  @registered_club.destroy
  	  flash[:error] = "Error. Club not added. Please start over."
  	end
  	redirect_to new_registered_club_path
  end
  
  private 
    def officer_params
      params.require(:officer).permit(:last_name, :first_name, :email)
    end

end
