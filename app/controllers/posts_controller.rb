class PostsController < ApplicationController
  before_action :signed_in_user

  def create
    @event = Event.find(params[:post][:event_id])
    @post = @event.posts.build(post_params)
    @post.user_id = current_user.id

    if @post.save
      current_user.add_post(@post)
      flash[:success] = "Post created."
      redirect_to @event
    else
      render @event
    end
  end
  
  private 

    def post_params
      params.require(:post).permit(:content)
    end

end
