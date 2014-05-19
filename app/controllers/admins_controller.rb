class AdminsController < ApplicationController
  def new
  	@admin = Admin.new
  end

  def create
    @admin = Admin.new(user_params)
    if @admin.save
      flash[:success] = "Welcome to Club-Biz!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def club
    @club = @admin.club
  end

  private

    def user_params
      params.require(:admin).permit(:last_name, :first_name, :email, 
        :password, :password_confirmation)
    end
    
end