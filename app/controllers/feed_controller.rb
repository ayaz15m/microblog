class FeedController < ApplicationController

  before_action :authenticate_login!

  def index
    ids_of_users_i_follow = Relationship.where(follower: @current_user.id).pluck(:user_id)
    @messages = Message.where(user_id: ids_of_users_i_follow).includes(:user).order("created_at DESC")
  end

  def message
    @message = Message.new
  end

  def update
    if @current_user.update(picture_params)
      redirect_to profile_path(@current_user)
    else
      render :edit
    end
  end

  def create_message
     message = message_params[:message]
     user = @current_user
     @message = Message.create user: user, message: message

     if @message.save
        redirect_to profile_path
      else
        render :message
      end
  end
  private
    def picture_params
      params.require(:user).permit(:pic)
    end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
