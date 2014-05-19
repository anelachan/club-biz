class TicketReservationsController < ApplicationController
  before_action :signed_in_user

  def create
  	@event = Event.find(params[:ticket_reservation][:event_id])
  	current_user.join!(@event)
  	respond to do |format|
  	  format.html
  	  format.js
  	end
  end


end
