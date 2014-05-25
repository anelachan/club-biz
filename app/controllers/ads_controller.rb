class AdsController < ApplicationController

  def create # accessed only through event/show_ads
  	@event = Event.find(params[:ad][:event_id])
  	@ad = @event.ads.build(ad_params)

  	if @ad.save
  	  flash[:success] = "Ad created!"
  	  @event.club.students.each do |student|
        # spawn a message to all CLUB FOLLOWERS
        @message = Message.new(ad_params)
        @message.club_id = @event.club_id
        @message.student_id = student.id
        @message.save
  	  end
  	  redirect_to @event
  	else
      flash[:error] = "Missing ad content. Try again."
  	  redirect_to ads_event_path (Event.find(params[:ad][:event_id]))
  	end
  end

  private 

    def ad_params
      params.require(:ad).permit(:content)
    end

end
