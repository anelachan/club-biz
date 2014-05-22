class EventsController < ApplicationController
  before_action :signed_in_user
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
    @posts = @event.posts
  end

  def new_reservation
    @event = Event.find(params[:id])
    @ticket_reservation = current_user.ticket_reservations.build(event_id: @event.id)
    render 'show_new_reservation'
  end

  def posts
    @event = Event.find(params[:id])
    @posts = @event.posts
    render 'show_posts'
  end

  def ads
    @event = Event.find(params[:id])
    render 'show_ads'
  end

  def announcements
    @event = Event.find(params[:id])
    render 'show_announcements'
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
      params.require(:event).permit(:name, :date, :start_time, :end_time,
      	:location, :description, :ticket_price, :initial_tickets_avail, :ticket_purchase_instructions,
      	:sales_start, :sales_end, :conditions, :website_URL)
    end

end
