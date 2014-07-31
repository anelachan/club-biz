class StudentsController < UsersController
  before_action :signed_in_user, only: [:clubs, :events, :messages]
  before_action :correct_user, only: [:clubs, :events, :messages]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(user_params)
    if @student.save
      flash[:success] = "Welcome to Club-Biz!"
      sign_in (@student)
      redirect_to events_student_path ({id: @student.id})
    else
      render 'new'
    end
  end
  
  # nav-bar student menu options
  def clubs
   	@title = "My Clubs"
   	@clubs = Student.find(params[:id]).clubs
   	render 'show_clubs'
  end

  def events
    @title = "My Events"
    @events = Student.find(params[:id]).events.select{|e| e.start > Time.now}
    render 'show_events'
  end

  def messages
    @title = 'Messages'
    @messages = Student.find(params[:id]).messages
    render 'show_messages'
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
