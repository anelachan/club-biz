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
  end

  def edit
  end

  def update
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
      	:location, :description, :ticket_price, :ticket_purchase_instructions,
      	:sales_start, :sales_end, :conditions, :website_URL)
    end

end
