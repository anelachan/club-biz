class AdsController < ApplicationController

  def create
  	@event = Event.find(params[:ad][:event_id])
  	@ad = @event.ads.build(ad_params)

  	if @ad.save
  	  flash[:success] = "Ad created!"
  	  @event.club.students.each do |student|
        @message = Message.new(ad_params)
        @message.club_id = @event.club_id
        @message.student_id = student.id
        @message.save
  	  end
  	  redirect_to @event
  	else
  	  render 'event/ads'
  	end
  end

  private 

    def ad_params
      params.require(:ad).permit(:content)
    end

end
