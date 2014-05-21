class AnnouncementsController < ApplicationController

  def create
  	@event = Event.find(params[:announcement][:event_id])
  	@announcement = @event.announcements.build(announcement_params)
  	@post = @event.posts.build(announcement_params)
  	@post.user_id = current_user.id

  	if @announcement.save and @post.save
  	  flash[:success] = "Posted announcement."
  	  @event.students.each do |student|
        @message = Message.new(announcement_params)
        @message.sender_id = @event.club_id
        @message.student_id = student.id
        @message.save
  	  end
  	  redirect_to @event
  	else
  	  render 'new'
  	end
  end

  private 

    def announcement_params
      params.require(:announcement).permit(:content)
    end

end
