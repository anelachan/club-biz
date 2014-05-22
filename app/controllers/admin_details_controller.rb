class AdminDetailsController < ApplicationController
  def create
    @admin = Admin.find(params[:admin_detail][:admin_id])
    @admin_detail = @admin.build_admin_detail(admin_detail_params)
  	if @admin_detail.save
  		  flash[:success] = "Details stored."
  		  redirect_to new_club_path ({remember_token: @admin.remember_token})
  	else
  		redirect_to details_admin_path ({id: @admin.id})
  	end
  end

  private
  	def admin_detail_params
  	   params.require(:admin_detail).permit(:position, :phone)
    end

end
