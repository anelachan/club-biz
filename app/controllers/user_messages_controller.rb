class UserMessagesController < ApplicationController
  def create
  	@message = Message.find(params[:user_message][:message_id])
  	@user.add_message(@message)
  end

end
