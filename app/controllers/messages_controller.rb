class MessagesController < ApplicationController

  # this controller is not currently used.

  def message_params
    params.require(:message).permit(:content)
  end

end
