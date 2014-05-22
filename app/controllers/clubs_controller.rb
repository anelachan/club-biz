class ClubsController < ApplicationController
  # ADD MORE ACCESS CONTROL

  def show
  	@club = Club.find(params[:id])
    @events = @club.events
  end

  def new
    @admin = Admin.find_by(remember_token: params[:remember_token])
    @club = @admin.build_club(admin_id: @admin.id)
    # will throw an exception w/o the token and redirect
    # problem, what if user has given up and not created club profile,
    # then tries to go in and create profile? 
    # user wouldn't get to register an account becuz already has a user...
    # ideally tokens would expire, if registration not completed then user should
    # be deleted. oh well.
    rescue NoMethodError # user can't just go in to new, or type in any old number as param.
      flash[:error] = "You must be a club administrator registered with Club-Biz to create a club profile."
      redirect_to new_verification_path
  end

  def create
    @admin = Admin.find(params[:club][:admin_id])
    @club = @admin.build_club(club_params)
  	if @club.save
  		flash[:success] = "Club created."
      sign_in (@admin)
  		redirect_to @club
  	else
  		render 'new'
  	end
  end

  def edit
    @current_user = current_user 
  end

  def update
    @club = current_user.club
  	if @club.update_attributes(club_params)
  		flash[:success] = "Club profile updated"
  		redirect_to @club
  	else
  		render edit
  	end
  end

  def index
    @clubs = Club.all
  end

  private

    def club_params
      params.require(:club).permit(:name, :description, :website_url)
    end

end
