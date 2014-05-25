class AdminsController < ApplicationController
  before_action :signed_in_user, only: [:events]
  before_action :correct_user, only: [:events]
  before_action :verified_club, only: [:new]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Welcome to Club-Biz!"
      redirect_to details_admin_path ({id: @admin.id, remember_token: @admin.remember_token})
      # pass a remember_token for crude security purposes
    else
      render 'new'
    end
  end

  def details # allows us to create admin details component
    @admin = Admin.find_by(remember_token: params[:remember_token])
    @admin_detail = @admin.build_admin_detail
    render 'show_details'
  end

  def events # the admin's club's events to manage
    @title = "Upcoming Events"
    @admin = Admin.find(params[:id])
    # filter out past events
    @events = Event.where('start > :now AND club_id = :club', now: Time.now, club: @admin.club)
    render 'show_events'
  end

  private

    def admin_params
      params.require(:admin).permit(:last_name, :first_name, :email, 
        :password, :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def verified_club
      redirect_to new_verification_path, notice: "First verify your club." unless Verification.exists?(remember_token: params[:remember_token])
    end

    def correct_user
      @admin = Admin.find_by(id:params[:id])
      redirect_to(root_url) unless current_user?(@admin)
    end
    
end
