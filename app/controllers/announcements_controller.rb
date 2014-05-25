class AnnouncementsController < ApplicationController

  def create # accessed only through event/show_announcements
  	@event = Event.find(params[:announcement][:event_id])
  	@announcement = @event.announcements.build(announcement_params)
  	@post = @event.posts.build(announcement_params)
  	@post.user_id = current_user.id 

  	if @announcement.save and @post.save
  	  flash[:success] = "Posted announcement."
  	  @event.students.each do |student|
        # send a message to all of the events' attendees
        @message = Message.new(announcement_params)
        @message.club_id = @event.club_id
        @message.student_id = student.id
        @message.save
  	  end
  	  redirect_to @event
  	else
      flash[:error] = "Missing announcement content. Try again."
  	  redirect_to announcements_event_path (Event.find(params[:announcement][:event_id]))
  	end
  end

  private 

    def announcement_params
      params.require(:announcement).permit(:content)
    end

end
