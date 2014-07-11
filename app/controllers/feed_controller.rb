class FeedController < ApplicationController

  before_action :authenticate_login!


  def index
    @relationship = Relationship.where(follower: @current_user.id)

    @message = []

    @relationship.each do |relationship|
      @message << Message.find_by(user_id: relationship.user_id)
    end
  end

  def message
    @message = Message.new
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
  def message_params
    params.require(:message).permit(:message)
  end
end
