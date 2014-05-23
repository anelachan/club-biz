class EventsController < ApplicationController
  before_action :signed_in_user
  before_action :student_user, only: [:new_reservation]
  before_action :not_already_attending, only: [:new_reservation]
  before_action :correct_admin, only: [:edit, :update, :ads, :announcement, :sales]

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	@event.club_id = current_user.club.id # i would prefer to use build
  	if @event.save
  	  current_user.club.add_event(@event) # necessary? definitely stupid...
  	  flash[:success] = "Event created."
      redirect_to @event
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
    @post = @event.posts.build(event_id: @event.id)
    @posts = @event.posts.take(@event.posts.size-1) # must slice off the anonymous new post
    @tickets_remaining = tickets_remaining
  end

  def new_reservation
    @event = Event.find(params[:id])
    @ticket_reservation = current_user.ticket_reservations.build(event_id: @event.id)
    render 'show_new_reservation'
  end

  def ads
    @event = Event.find(params[:id])
    render 'show_ads'
  end

  def announcements 
    @event = Event.find(params[:id])
    render 'show_announcements'
  end

  def sales
    @event = Event.find(params[:id])
    @reservations = @event.ticket_reservations
    @total_sales = (@event.ticket_price * @reservations.sum(:num_tickets)).to_s
    render 'show_sales'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def index
    @events = Event.all
  end

  def delete
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:name, :start, :end,
      	:location, :description, :ticket_price, :initial_tickets_avail, 
        :ticket_purchase_instructions, :sales_start, :sales_end, :conditions, 
        :website_URL)
    end

    def tickets_purchased?
      !@event.ticket_reservations.empty?
    end

    def tickets_remaining
      if tickets_purchased?
        @event.initial_tickets_avail - @event.ticket_reservations.sum(:num_tickets)
      else
        @event.initial_tickets_avail
      end
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_admin
      @event = Event.find(params[:id])
      @club = Club.find_by(id:@event.club_id)
      @admin = Admin.find_by(id: @club.admin_id) # the correct admin of this event's club
      redirect_to root_url, notice: "Access denied." unless current_user?(@admin)
    end

    def student_user
      redirect_to event_path, notice: "Only student users are permitted to make ticket reservations." unless student?
    end

    def not_already_attending
      @event = Event.find(params[:id])
      redirect_to root_url, notice: "You are already attending that event." if @event.students.exists?(id: current_user.id)
    end


end
