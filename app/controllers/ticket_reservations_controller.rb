class TicketReservationsController < ApplicationController

  def create # accessible through event/show_new_reservation
  	@event = Event.find(params[:ticket_reservation][:event_id])
  	@ticket_reservation = current_user.ticket_reservations.build(reservation_params)
    @tickets_remaining = tickets_remaining
  	if enough_tickets? and @ticket_reservation.save 
      send_message # send ticket confirmation
  	  flash[:success] = "Reservation completed."
      redirect_to @event
  	else
  	  flash[:error] = "Reservation failed. Check number of tickets."
      redirect_to new_reservation_event_path (@event)
  	end
    
  end

  private
    def reservation_params
      params.require(:ticket_reservation).permit(:num_tickets, :event_id)
   	end

   	def confirmation_content
   	  content = "This is a confirmation of your reservation for " + 
   	  @event.name + ". Number of tickets purchased: " + @ticket_reservation.num_tickets.to_s +
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

    def enough_tickets?
      tickets_remaining.to_i > params[:ticket_reservation][:num_tickets].to_i
    end

    def tickets_remaining
      if tickets_purchased?
        @event.initial_tickets_avail - @event.ticket_reservations.sum(:num_tickets)
      else
        @event.initial_tickets_avail
      end
    end

    def tickets_purchased?
      !@event.ticket_reservations.empty?
    end

end
