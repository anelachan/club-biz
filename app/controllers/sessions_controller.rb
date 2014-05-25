class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      # route user to appropriate page
      if student?
        redirect_to events_student_path({id: user.id})
      elsif admin?
        redirect_to events_admin_path({id: user.id})
      elsif root?
        redirect_to new_registered_club_path({id: user.id})
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end