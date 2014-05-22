class AdminsController < ApplicationController
  before_action :signed_in_user, only: [:details, :events]
  before_action :correct_user, only: [:details, :events]
  before_action :verified_club, only: [:new, :create]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Welcome to Club-Biz!"
      redirect_to details_admin_path ({id: @admin.id, remember_token: @admin.remember_token})
    else
      render 'new'
    end
  end

  def details
    @admin = Admin.find_by(remember_token: params[:remember_token])
    @admin_detail = @admin.build_admin_detail
    render 'show_details'
  end

  def events
    @title = "Upcoming Events"
    @admin = Admin.find(params[:id])
    @events = @admin.club.events
    render 'show_events'
  end

  private

    def admin_params
      params.require(:admin).permit(:last_name, :first_name, :email, 
        :password, :password_confirmation)
    end

    def signed_in__user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def verified_club
      redirect_to new_verification_path, notice: "Only verified clubs can register with Club-Biz." unless Verification.exists?(remember_token: params[:remember_token])
    end

    def correct_user
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_user?(@admin)
    end
    
end
