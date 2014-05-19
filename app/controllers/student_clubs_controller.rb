class StudentClubsController < ApplicationController
  before_action :signed_in_user

  def create
    @club = Club.find(params[:student_club][:club_id])
    current_user.follow!(@club)
    respond_to do |format|
      format.html { redirect_to @club }
      format.js
    end
  end

  def destroy
    @club = StudentClub.find(params[:id]).club
    current_user.unfollow!(@club)
    respond_to do |format|
      format.html { redirect_to @club }
      format.js
    end
  end
end
