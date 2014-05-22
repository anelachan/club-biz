class AdminsController < ApplicationController
  def new
    @registered_club = RegisteredClub.find(params[:id]) 
    # this is no good, you could write in any id you wanted as long as it exists!
    # idea... store a hash of the registered club ids, a kind of password?
    # so that any user can't just write in id=# and create an admin account for themselves?
    @admin = Admin.new
    rescue ActiveRecord::RecordNotFound # user cannot just go to admins/new!
      flash[:error] = "You must be registered with the university to create an account."
      redirect_to new_verification_path
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

  def club # NEEDED?
    @club = @admin.club
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
    
end
