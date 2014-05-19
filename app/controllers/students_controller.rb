class StudentsController < UsersController

  def new
    @student = Student.new
  end

  def create
    @user = Student.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Club-Biz!"
      redirect_to root_url
    else
      render 'new'
    end
  end
   
  def clubs
   	@title = "My Clubs"
    @student = Student.find(params[:id])
   	@clubs = @student.clubs
   	render 'show_clubs'
  end

  def events
    @title = "My Events"
    @student = Student.find(params[:id])
    @events = @student.events
    render 'show_events'
  end

  private

    def user_params
      params.require(:student).permit(:last_name, :first_name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = Student.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
