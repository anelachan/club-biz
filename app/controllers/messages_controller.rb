class MessagesController < ApplicationController
  def new
  	@message = Message.new(message_params)
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end

end
