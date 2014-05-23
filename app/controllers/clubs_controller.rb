class ClubsController < ApplicationController
before_action :has_admin_acct, only: [:new]
before_action :signed_in_user, only: [:edit, :update]
before_action :correct_user, only: [:edit, :update]

  def show
  	@club = Club.find(params[:id])
    @events = @club.events
  end

  def new
    @admin = Admin.find_by(remember_token: params[:remember_token])
    @club = @admin.build_club(admin_id: @admin.id)
  end

  def create
    @admin = Admin.find(params[:club][:admin_id])
    @club = @admin.build_club(club_params)
  	if @club.save
  		flash[:success] = "Club profile created! The registration process is complete."
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

    def has_admin_acct
      redirect_to new_verification_path, notice: "You must be a club administrator registered with Club-Biz to create a club profile." unless Admin.exists?(remember_token: params[:remember_token])
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @club = Club.find(params[:id])
      @admin = Admin.find_by(id: @club.admin_id) # the correct admin of this club
      redirect_to(root_url) unless current_user?(@admin)
    end


end
