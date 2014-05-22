class VerificationsController < ApplicationController
  include VerificationsHelper

  def new
  	@verification = Verification.new
  end

  def create
  	@verification = Verification.new(verification_params)
  	if @verification.save
  	  if verified?
	  	  flash[:success] = "Club verified."
	  	  redirect_to new_admin_path ({:remember_token => @verification.remember_token})
  	  else
	  	  flash[:error] = "Sorry, your club was not found in our system. 
	  	  Please check your details and try again."
	  	  render 'new'
  	  end
  	else
  		render 'new'
 	end
  end

  private

    def verification_params
      params.require(:verification).permit(:name, :uni_club_id, :president_last_name,
      	:president_first_name, :president_email)
    end

end
