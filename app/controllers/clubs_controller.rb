class ClubsController < ApplicationController
  before_action :signed_in_user
  # ADD MORE ACCESS CONTROL

  def show
  	@club = Club.find(params[:id])
    @events = @club.events
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params) # change this to build?
    @club.admin_id = current_user.id
  	if @club.save
  		flash[:success] = "Club created."
      current_user.add_club(@club)
  		redirect_to @club
  	else
  		render 'new'
  	end
  end

  def edit
    
  end

  def update
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
