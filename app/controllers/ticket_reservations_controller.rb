class TicketReservationsController < ApplicationController
  before_action :signed_in_user

  def create
  	@event = Event.find(params[:ticket_reservation][:event_id])
  	@ticket_reservation = current_user.ticket_reservations.build(reservation_params)

  	if @ticket_reservation.save
  	  flash[:success] = "Reservation completed."
  	  send_message
  	  redirect_to @event
  	else
  	  flash[:error] = "Reservation failed."
  	  render 'event/new_reservation'
  	end
  end

  private
    def reservation_params
      params.require(:ticket_reservation).permit(:num_tickets, :event_id)
   	end

   	def confirmation_content
   	  content = "This is a confirmation of your reservation for " + 
   	  @ticket_reservation.num_tickets.to_s + " tickets to " + @event.name +
   	  ". It is your responsibility to pick up and purchase your tickets. 
   	  Instructions are as follows: " +
   	  @event.ticket_purchase_instructions
   	end

   	def send_message
   	  @message = Message.new(content: confirmation_content)
      @message.club_id = @event.club_id
      @message.student_id = current_user.id
      @message.save
    end

end
